import 'package:core/core.dart';
import 'package:firebase_eco/firebase_eco.dart';

class FCMHandler {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static bool _isInitialized = false;

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
    playSound: true,
  );

  Future<void> init() async {
    // Prevent duplicate initialization
    if (_isInitialized) {
      print('[log] FCM already initialized, skipping...');
      return;
    }

    print('[log] Initializing FCM after successful order fetch');

    try {
      // Check if Firebase is already initialized
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }

      // Request permissions and set up notifications
      await _setupNotifications();

      // Get and handle FCM token
      await _setupFCMToken();

      // Set up message handlers
      await _setupMessageHandlers();

      _isInitialized = true;
      print('[log] FCM initialization completed successfully');
    } catch (e) {
      print('[log] Error during FCM initialization: $e');
      _isInitialized = false; // Allow retry on failure
      rethrow;
    }
  }

  Future<void> _setupNotifications() async {
    await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    final androidPlugin = _notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.createNotificationChannel(_channel);
    }

    await _initLocalNotifications();
  }

  Future<void> _setupFCMToken() async {
    final token = await _fcm.getToken();
    print('[log] FCM Token: $token');

    _fcm.onTokenRefresh.listen((newToken) {
      print('[log] FCM Token refreshed: $newToken');
      _updateTokenOnServer(newToken);
    });
  }

  Future<void> _setupMessageHandlers() async {
    // Register background handler first
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

    // Foreground message handler
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Message open handler
    FirebaseMessaging.onMessageOpenedApp.listen(_handleAppOpenMessage);
  }

  Future<void> _updateTokenOnServer(String token) async {
    try {
      print('[log] Updating FCM token on server: $token');
    } catch (e) {
      print('[log] Error updating token on server: $e');
    }
  }

  static Future<void> _initLocalNotifications() async {
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
      onDidReceiveNotificationResponse: handleNotificationTap,
    );
  }

  static void handleNotificationTap(NotificationResponse response) {
    if (response.payload != null) {
      print('[log] Notification tapped with payload: ${response.payload}');
      // TODO: Implement your notification tap handling logic
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    print('[log] Background message received: ${message.data}');
    await _processMessage(message.data);
  }

  void _handleForegroundMessage(RemoteMessage message) {
    print('[log] Foreground message received: ${message.data}');
    _processMessage(message.data);
  }

  void _handleAppOpenMessage(RemoteMessage message) {
    print('[log] App opened from notification: ${message.data}');
    _processMessage(message.data);
  }

  static Future<void> _processMessage(Map<String, dynamic> data) async {
    print('[log] Processing FCM message: $data');
    try {
      if (data['success'] == true && data.containsKey('data')) {
        final messageData = data['data'];
        // TODO: Implement your message processing logic
        print('[log] Message data processed: $messageData');
      }
    } catch (e) {
      print('[log] Error processing message: $e');
    }
  }
}