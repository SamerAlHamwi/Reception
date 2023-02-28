import 'package:ministries_reception_app/core/utils/service_locator.dart';
import 'package:ministries_reception_app/features/unit_screen/presentation/pages/unit_screen_page.dart';

import '../../constants/app_constants.dart';
import '../../utils/jitsi_video_meeting/video_meeting_service.dart';
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
      case NotificationType.YouShouldJoinCall:
        VideoMeetingService.startMeeting(
            roomText: notification.room!,
            serverUrl: notification.serverLink!,
            meetingId: int.parse(notification.callId!));
        break;

      case NotificationType.NewRequestHasPublished:
        UnitScreenPage.updateVisitorList();
        break;
         case NotificationType.TheRequestHasTreated:
           UnitScreenPage.updateVisitorList();

           break;


    }
  }
}
