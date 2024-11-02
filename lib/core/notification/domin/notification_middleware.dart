import 'package:audioplayers/audioplayers.dart';
import 'package:ministries_reception_app/features/call_reception/data/call_model.dart';
import 'package:ministries_reception_app/features/call_reception/repository/call_reception_repo.dart';
import 'package:ministries_reception_app/features/unit_screen/presentation/pages/all_untis_screen.dart';
import 'package:ministries_reception_app/features/unit_screen/presentation/pages/unit_screen_page.dart';

import '../../../features/call_reception/presentation/pages/call_list_page.dart';
import '../../../features/main_unit/presentation/pages/main_unit_screen.dart';
import '../../constants/app_constants.dart';
import '../../utils/video_meeting/video_meeting_service.dart';
import '../data/fcm_notification_model.dart';

class NotificationMiddleware {
  static forward(FCMNotificationModel notification) async {
    switch (notification.type) {
      case NotificationType.NULL:
        break;
    }
  }

  static onRceived(FCMNotificationModel notification) async {
    print("ddddddddddddddddddddddddddddddddddddddddddd");
    print(notification.message);
    print(notification.callId);
    print(notification.dateTime);
    print(notification.id);
    print(notification.notificationName);
    print(notification.relatedId);
    print(notification.state);
    print(notification.type);

    switch (notification.type) {
      case NotificationType.NULL:
        break;
      case NotificationType.NewCallRequestHasPublished:
        CallListPage.refreshCallList();
        break;
      case NotificationType.YouShouldJoinCall:
        CallReceptionRepo.joinCall(id: int.parse(notification.callId!)).then((value) async {
          if(value is Call){
            VideoMeetingService.startMeeting(call: value);
          }
        });
        break;
      case NotificationType.YouShouldLeaveCall:
        CallReceptionRepo.leaveCall(id: int.parse(notification.callId!));
        VideoMeetingService.leaveMeeting();
        break;
      case NotificationType.NewRequestHasPublished:
        UnitScreenPage.updateVisitorList();
        MainUnitScreen.updateVisitorList();
        AllUnitsScreenPage.updateVisitorList();
        final player = AudioPlayer();
        await player.play(AssetSource("audio/notification_sound.mp3"));
        break;
      case NotificationType.TheRequestHasTreated:
        UnitScreenPage.updateVisitorList();
        MainUnitScreen.updateVisitorList();
        AllUnitsScreenPage.updateVisitorList();
        break;
      case NotificationType.PushNotification:
        // TODO: Handle this case.
        break;
      case NotificationType.TheCallHasCanseld:
        // TODO: Handle this case.
        CallListPage.refreshCallList();
        break;
      case NotificationType.ScreenJoinCall:
        CallListPage.refreshCallList();
        //  ServiceLocator.refreshCalls();
        break;
      case NotificationType.ScreenLeaveCall:
        CallListPage.refreshCallList();
        //  ServiceLocator.refreshCalls();
        break;
    }
  }
}
