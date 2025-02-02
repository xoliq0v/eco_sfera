import 'dart:convert';
import 'dart:math';

import 'package:core/core.dart';
import 'package:firebase_eco/firebase_eco.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'partner_order_state.dart';

class PartnerOrderCubit extends Cubit<PartnerOrderState>
    with PaginationCubitWrapper {
  PartnerOrderCubit(
        this._changePartnerStatus,
        this._getType,
        this._fethchPartnerOrders,
        this._changeOrderStatus, {
        required int initialPageSize,
    }) : super(const PartnerOrderState()){
    localInitialPageSize = initialPageSize;
    _listenToBotChanges();
    _initializeFCM();
  }

  final GetPartnerOrdersUseCase _fethchPartnerOrders;
  final GetAuthType _getType;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final ChangePartnerStatusUseCase _changePartnerStatus;
  final ChangeOrderStatusUseCase _changeOrderStatus;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = 
    FlutterLocalNotificationsPlugin();
  // final BuildContext context;
  
  bool _isAppOpen = true; // Track app state

  @override
  Future<void> close() {
    _isAppOpen = false;
    return super.close();
  }

  Future<void> _initializeFCM() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      const initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const initializationSettingsIOS = DarwinInitializationSettings();
      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          _handleNotificationTap(details);
        },
      );

      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
      
      // Handle initial notification if app was terminated
      RemoteMessage? initialMessage = 
          await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        _handleInitialMessage(initialMessage);
      }

      String? token = await _firebaseMessaging.getToken();
      print('FCM Token: $token');
    }
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    print('Received foreground message: ${message.data}');

    // if (message.data['type'] == 'partner_order') {
      await refresh();
      
      // Show dialog directly if app is in foreground
      _showOrderDialog(
        orderId: 'id',
        title: message.notification?.title ?? 'New Order',
        message: message.notification?.body ?? 'You have a new order!',
      );

      await _showLocalNotification(
        title: message.notification?.title ?? 'New Order',
        body: message.notification?.body ?? 'You have a new order!',
        payload: message.data.toString(),
      );
    // }
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print('Handling background message: ${message.data}');
    
    // if (message.data['type'] == 'partner_order') {
      await refresh();
      _showOrderDialog(
        orderId: '',
        title: message.notification?.title ?? 'New Order',
        message: message.notification?.body ?? 'You have a new order!',
        isBottomSheet: true,
      );
    // }
  }


  void _showOrderDialog({
    required String orderId,
    required String title,
    required String message,
    bool isBottomSheet = false,
  }) {
    if (!_isAppOpen) return;

    if (isBottomSheet) {
      // showModalBottomSheet(
      //   context: context,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      //   ),
      //   builder: (context) => _buildDialogContent(
      //     context: context,
      //     orderId: orderId,
      //     title: title,
      //     message: message,
      //   ),
      // );
    } else {
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: Text(title),
      //     content: _buildDialogContent(
      //       context: context,
      //       orderId: orderId,
      //       title: title,
      //       message: message,
      //     ),
      //   ),
      // );
    }
  }

  Future<void> _handleInitialMessage(RemoteMessage message) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Wait for app to initialize
    // if (message.data['type'] == 'partner_order') {
      await refresh();
      _showOrderDialog(
        orderId: '',
        title: message.notification?.title ?? 'New Order',
        message: message.notification?.body ?? 'You have a new order!',
        isBottomSheet: true,
      );
    // }
  }


  Widget _buildDialogContent({
    required BuildContext context,
    required String orderId,
    required String title,
    required String message,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(message),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await accept(int.parse(orderId));
                  if (context.mounted) Navigator.pop(context);
                },
                child: const Text('Accept Order'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'partner_orders_channel',
      'Partner Orders',
      channelDescription: 'Notifications for partner orders',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      title,
      body,
      details,
      payload: payload,
    );
  }

  void _handleNotificationTap(NotificationResponse details) {
    if (details.payload != null) {
      final payloadData = Map<String, dynamic>.from(
        jsonDecode(details.payload!) as Map<dynamic, dynamic>
      );
      
      _showOrderDialog(
        orderId: 'orderId',
        title: 'YANGI Order',
        message: 'You have a new order!',
        isBottomSheet: true,
      );
    }
  }

  Future<bool> accept(int id) async{
    await _changeOrderStatus.call(id, 'accepted');
    return true;
  }

  void _listenToBotChanges() async{
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    _firebaseDatabase.ref('bot').onValue.listen((event) {
      final botValue = event.snapshot.value;
      print('[log] Bot value changed: $botValue');
      if(botValue != null){
        _fetchWithoutLoading(LocationEntity(latitude: 0, longitude: 0));
      }
    });
  }

  void _fetchWithoutLoading(LocationEntity location){
    localCurrentPage = 0;
    _fetch(location: location);
  }

  Future<bool?> fetchPartnerOrders(LocationEntity location) async {
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return null;
    }
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) emit(state.copyWith(isLoadingShimmer: true));
    if (isLoaded && state.partnerOrders.isNotEmpty) {
      emit(state.copyWith(isLoadingPagination: true));
    }
    return _fetch(location: location);
  }

  Future<bool?> refresh() async {
    if (state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    localCurrentPage = 0;
    return _fetch(isRefresh: true, location: LocationEntity(latitude: 0, longitude: 0));
  }

  Future<bool> _fetch({
    bool isRefresh = false,
    required LocationEntity location,
  }) async {
    final res = await _fethchPartnerOrders.getPartnerOrders(
      localCurrentPage,
      localPageSize,
      'new',
    );
    switch (res.status) {
      case Status.completed:
        final history = res.data?.content ?? [];
        final updatedHistory = history.map((his) {
          final distance = calculateDistance(
            location,
            double.parse(his.latitude!),
            double.parse(his.longitude!),
          );
          return his.copyWith(distance: distance);
        }).toList();

        isLastPage = history.length < localPageSize;
        isLoaded = true;

        if (res.data?.pagination.total != null) {
          isLastPage = res.data!.pagination.total - 1 == localCurrentPage;
        }

        if (!isLastPage) localCurrentPage += 1;

        emit(state.copyWith(
          customers: isRefresh
              ? updatedHistory
              : [...state.partnerOrders, ...updatedHistory],
        ));
        return true;

      case Status.error:
        emit(state.copyWith(
          error: res.error?.message ?? '',
          errorPagination: res.error?.message ?? '',
        ));
        return false;
    }
  }

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
    return earthRadius * c;
  }

  Future<void> search(String query) async{
    final sortedOrders = state.partnerOrders.where((order) => order.driver.name?.contains(query) ?? false).toList();
    if(sortedOrders.isEmpty){
      emit(state.copyWith(error: 'No orders found'));
    }else{
      emit(state.copyWith(customers: sortedOrders));
    }
  }

}
