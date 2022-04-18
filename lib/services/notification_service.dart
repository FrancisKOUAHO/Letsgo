import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
class NotificationService {

  static void initialize() {
    // for ios and web
    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onMessage.listen((event) {
      if (kDebugMode) {
        print('Un nouvel événement onMessage a été publié !');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Un nouvel événement onMessageOpenedApp a été publié !');
      }
    });
  }


  static Future<String?> getToken() async {
    return FirebaseMessaging.instance.getToken();
  }

}