import 'package:ministries_reception_app/core/utils/service_locator.dart';

import '../../constants/app_constants.dart';
import '../data/fcm_notification_model.dart';

class NotificationMiddleware {
  static forward(FCMNotificationModel notification) async {
    switch (notification.type) {
      case NotificationType.NULL:
        break;
    }
  }

  static onRceived(FCMNotificationModel notification) async {
    switch (notification.type) {
      case NotificationType.NULL:
        break;
      case NotificationType.NewCallRequestHasPublished:
        ServiceLocator.refreshCalls();
        break;
    }
  }
}
