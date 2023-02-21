import '../../core/constants/constant.dart';
import 'package:flutter_fcm/flutter_fcm.dart';

import 'package:flutter_fcm/Notification/FCM.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../features/notification/repository/notification_repository.dart';
import '../../features/unit_screen/presentation/pages/unit_screen_page.dart';
import '../utils/shared_storage.dart';

class Messaging {
  static String? token;

  static Future<void> onNotificationReceived(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Handling a message ${message.messageId}');
    UnitScreenPage.updateVisitorList();



  }

  static initFCM() async {
    try {
      await FCM.initializeFCM(
        onNotificationReceived: onNotificationReceived,
        withLocalNotification: true,
        onNotificationPressed: (Map<String, dynamic> data) {
          // Notifications notification = Notifications.fromFCM(data);
          // NotificationMiddleware.forward(notification);
        },
        onTokenChanged: (String? token) {
          Messaging.token = token;
          if (SharedStorage.hasToken()) {
            NotificationRepository.uploadNotificationsToken(Messaging.token);
          }
          print("token");
          print(token);
        },
        // TODO add this icon to android/app/src/main/res/drawable/ic_launcher.png
        icon: 'ic_launcher',
        navigatorKey: Keys.navigatorKey,
      );
    } catch (e) {}
  }
}
