import 'dart:convert';
import 'dart:math';

import '../../../app_bloc.dart';
import 'package:core/core.dart';
import 'package:firebase_eco/firebase_eco.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import 'package:use_case/use_case.dart';

part 'order_cubit.freezed.dart';
part  'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
      this.getOrderUseCase,
      this.fcmTokenRefresh,
      this.watchPost,
      this._getType,
      ) : super(const OrderState.init()) {
    _initializeFCM();
    _listenToBotChanges(); // Listen to bot changes
  }

  final GetOrder getOrderUseCase;
  final FCMTokenRefresh fcmTokenRefresh;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _isFCMInitialized = false;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  bool isInitialFetch = true;
  final WatchPost watchPost;
  final GetAuthType _getType;

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
    playSound: true,
  );

  void _listenToBotChanges() async{
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    _firebaseDatabase.ref('bot').onValue.listen((event) {
      final botValue = event.snapshot.value;
      print('[log] Bot value changed: $botValue');

      if (botValue != null) {
        final currentLocation = (state is _Success) ? (state as _Success).currentLocation : null;
        if (currentLocation != null) {
          _getOrdersWithoutLoading(currentLocation, isRealtime: true);
        } else {
          print('[log] Current location is null, cannot fetch orders.');
        }
      }
    });
  }

  Future<void> accept(int id) async{
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    await watchPost.watch(id);
  }

  Future<void> getOrder(LocationEntity location) async {
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    if (isInitialFetch) {
      emit(const OrderState.loading());
    }

    final result = await getOrderUseCase.get();

    if (result.status == Status.error || result.data == null) {
      emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {
      final value = await result.data?.map((data) {
        if (data.locations.isEmpty) return data;

        return data.copyWith(
          distance: calculateDistance(
            location,
            double.parse(data.locations[0].latitude),
            double.parse(data.locations[0].longitude),
          ),
        );
      }).toList();

      emit(OrderState.success(
        value ?? [],
        currentLocation: location,
        isInitialFetch: isInitialFetch,
      ));

      isInitialFetch = false;
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }


  Future<void> _getOrdersWithoutLoading(LocationEntity location, {required bool isRealtime}) async {
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    final result = await getOrderUseCase.get();
    if (result.status == Status.error || result.data == null) {
      emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {
      final value = await result.data?.map((data) {
        if (data.locations.isEmpty) return data;

        return data.copyWith(
          distance: calculateDistance(
            location,
            double.parse(data.locations[0].latitude),
            double.parse(data.locations[0].longitude),
          ),
        );
      }).toList();

      // Compare with current state to find new orders
      if (state is _Success) {
        final currentOrders = (state as _Success).orders;
        final newOrders = value?.where((newOrder) =>
        !currentOrders.any((currentOrder) => currentOrder.id == newOrder.id)
        ).toList() ?? [];

        emit(OrderState.success(
          value ?? [],
          currentLocation: location,
          isRealtime: isRealtime,
          newOrders: newOrders,
        ));
      } else {
        emit(OrderState.success(
          value ?? [],
          currentLocation: location,
          isRealtime: isRealtime,
          newOrders: value ?? [],
        ));
      }
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }


  Future<void> _initializeFCM() async {
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    if (_isFCMInitialized) return;

    try {
      // Request permissions
      await _fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      // Set up notification channel for Android
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (androidPlugin != null) {
        await androidPlugin.createNotificationChannel(_channel);
      }

      // Initialize local notifications
      await _initLocalNotifications();

      // Get FCM token
      final token = await _fcm.getToken();
      print('[log] FCM Token: $token');

      // Set up token refresh listener
      _fcm.onTokenRefresh.listen(_handleTokenRefresh);

      // Set up message handlers
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleAppOpenMessage);
      FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

      _isFCMInitialized = true;
      print('[log] FCM initialized successfully');
    } catch (e) {
      print('[log] FCM initialization error: $e');
      _isFCMInitialized = false;
    }
  }

  Future<void> _initLocalNotifications() async {
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    const initializationSettingsAndroid =
    AndroidInitializationSettings('@drawable/ic_notification');

    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationTap,
    );
  }

  void _handleNotificationTap(NotificationResponse response) {
    if (response.payload != null) {
      print('[log] Notification tapped with payload: ${response.payload}');
      _processMessage(jsonDecode(response.payload.toString()) as Map<String, dynamic>);
    }
  }

  // Future<void> getOrder(LocationEntity location) async {
  //   emit(const OrderState.loading());
  //
  //   final result = await getOrderUseCase.get();
  //
  //   if (result.status == Status.error || result.data == null) {
  //     emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
  //     return;
  //   }
  //
  //   try {
  //     final value = await result.data?.map((data) {
  //       if (data.locations.isEmpty) return data;
  //
  //       return data.copyWith(
  //         distance: calculateDistance(
  //           location,
  //           double.parse(data.locations[0].latitude),
  //           double.parse(data.locations[0].longitude),
  //         ),
  //       );
  //     }).toList();
  //
  //     emit(OrderState.success(value ?? [], currentLocation: location));
  //   } catch (e) {
  //     emit(OrderState.error(e.toString()));
  //   }
  // }

  Future<void> _handleTokenRefresh(String token) async {
    await fcmTokenRefresh.refresh(token);
  }

  void _handleForegroundMessage(RemoteMessage message) {
    print('[log] Foreground message received: ${message.data}');
    _processMessage(message.data);
  }

  void _handleAppOpenMessage(RemoteMessage message) {
    print('[log] App opened from notification: ${message.data}');
    _processMessage(message.data);
  }

  @pragma('vm:entry-point')
  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    print('[log] Background message received: ${message.data}');
    // Note: Can't use cubit in background handlers
    // Implement any necessary background processing here
  }

  void _processMessage(Map<String, dynamic> data) {
      _handleNewOrder(data);
    // try {
    //   print('[log] Processing message data: $data');
    //
    //   // Handle different message types
    //   final String? messageType = data['type'] as String?;
    //
    //   switch (messageType) {
    //     case 'new_order':
    //
    //       break;
    //     case 'order_update':
    //       // _handleOrderUpdate(data);
    //       break;
    //     case 'order_cancelled':
    //       // _handleOrderCancellation(data);
    //       break;
    //     default:
    //       print('[log] Unknown message type: $messageType');
    //   }
    // } catch (e) {
    //   print('[log] Error processing message: $e');
    // }
  }

  void _handleNewOrder(Map<String, dynamic> data) {
    try {
      final newOrder = data.toOrderModel();
      if (newOrder == null) {
        print('[log] Failed to parse new order data');
        return;
      }

      if (state is _Success) {
        final currentState = state as _Success;
        final currentLocation = currentState.currentLocation;
        final currentOrders = List<OrderModel>.from(currentState.orders);

        // Calculate distance if location is available
        OrderModel orderToAdd = newOrder;
        if (currentLocation != null && newOrder.locations.isNotEmpty) {
          final distance = calculateDistance(
            currentLocation,
            double.parse(newOrder.locations[0].latitude),
            double.parse(newOrder.locations[0].longitude),
          );
          orderToAdd = newOrder.copyWith(distance: distance);
        }

        // Insert new order at the beginning of the list
        currentOrders.insert(0, orderToAdd);

        // Update state with new order list and animate flag
        emit(OrderState.success(
          currentOrders, currentLocation: currentLocation,
        ));

        // Show notification
        _showNewOrderNotification(orderToAdd);
      }
    } catch (e) {
      print('[log] Error handling new order: $e');
    }
  }

  Future<void> _showNewOrderNotification(OrderModel order) async {
    const androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.show(
      order.id, // Use order ID as notification ID
      'New Order Received',
      'Order #${order.id} - ${order.totalKg}kg, ${order.totalPrice}',
      details,
      payload: jsonEncode({
        'type': 'new_order',
        'order_id': order.id,
      }),
    );
  }

  // void _handleOrderUpdate(Map<String, dynamic> data) {
  //   // Update specific order in the list
  //   if (state is _Success) {
  //     final orders = (state as _Success).orders;
  //     final orderId = data['order_id'];
  //     // Update logic here
  //   }
  // }
  //
  // void _handleOrderCancellation(Map<String, dynamic> data) {
  //   // Remove cancelled order from list
  //   if (state is _Success) {
  //     final orders = (state as _Success).orders;
  //     final orderId = data['order_id'];
  //     // Removal logic here
  //   }
  // }

  // Future<void> getOrder(LocationEntity location) async {
  //   emit(const OrderState.loading());
  //
  //   final result = await getOrderUseCase.get();
  //
  //   if (result.status == Status.error || result.data == null) {
  //     emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
  //     return;
  //   }
  //
  //   try {
  //     final value = await result.data?.map((data) {
  //       if (data.locations.isEmpty) return data;
  //
  //       return data.copyWith(
  //         distance: calculateDistance(
  //           location,
  //           double.parse(data.locations[0].latitude),
  //           double.parse(data.locations[0].longitude),
  //         ),
  //       );
  //     }).toList();
  //
  //     emit(OrderState.success(value ?? [], currentLocation: location));
  //
  //     if (!_isFCMInitialized) {
  //       await _initializeFCM();
  //     }
  //   } catch (e) {
  //     emit(OrderState.error(e.toString()));
  //   }
  // }

  double calculateDistance(LocationEntity userLocation, double orderLat, double orderLon) {
    const double earthRadius = 6371;

    double degreesToRadians(double degrees) => degrees * (pi / 180);

    double dLat = degreesToRadians(orderLat - userLocation.latitude);
    double dLon = degreesToRadians(orderLon - userLocation.longitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(userLocation.latitude)) *
            cos(degreesToRadians(orderLat)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * asin(sqrt(a));
    return (earthRadius * c) < 1 ? earthRadius * c * 1000 : earthRadius * c;
  }

  Future<void> retry(LocationEntity location) async {
    final result = await getOrderUseCase.get();

    if (result.status == Status.error || result.data == null) {
      emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {
      final value = await result.data?.map((data) {
        return data.copyWith(
          distance: calculateDistance(
            location,
            double.parse(data.locations[0].latitude),
            double.parse(data.locations[0].longitude),
          ),
        );
      }).toList();

      emit(OrderState.success(value ?? [],currentLocation: location));
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }

  Future<void> init() async{
    emit(OrderState.init());
  }

  Future<void> search(String query) async{
    final sortedOrders = (state as _Success).orders.where((order) => order.status).toList();
    if(sortedOrders.isEmpty){
      emit(OrderState.error('No orders found'));
    }else{
      emit(OrderState.success(sortedOrders, currentLocation: (state as _Success).currentLocation, isRealtime: (state as _Success).isRealtime, newOrders: (state as _Success).newOrders));
    }
  }
}
