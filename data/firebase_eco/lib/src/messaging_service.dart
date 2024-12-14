import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseNotificationService {
  FirebaseNotificationService({required this.firebaseMessaging});
  final FirebaseMessaging firebaseMessaging;

  Future<void> initNotifications() async {
    // Request notification permissions
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // Handle notification tap when app is in background/terminated state
      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
    }
  }

  void _handleForegroundMessage(RemoteMessage message) {
    if (message.notification != null) {
      // Show local notification or update UI
      _showLocalNotification(message);
    }
  }

  void _showLocalNotification(RemoteMessage message) {
    // Implement local notification display logic
    // You can use packages like flutter_local_notifications
  }

  void _handleNotificationTap(RemoteMessage message) {
    // Handle notification tap - navigate to specific screen
    // Example: navigateToSpecificScreen(message.data);
  }

  Future<String?> getFirebaseToken() async {
    return await firebaseMessaging.getAPNSToken();
  }

  // Background message handler
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    // Handle background message
    if (kDebugMode) {
      print("Handling a background message: ${message.messageId}");
    }
  }
}