import 'package:ministries_reception_app/core/utils/shared_storage.dart';
import 'package:quiver/async.dart';

import '../../notification/data/fcm_notification_model.dart';
import 'utils/jitsi_meet_wrapper.dart';

class VideoMeetingService {
  static int? meetingId;
  static Jitsi? jitsi;
  static CountdownTimer? timer;

  static startMeeting(
      {required String roomText,
      required String serverUrl,
      String? callerName,
      int? timeToLeave,
      required int meetingId}) async {
    if (VideoMeetingService.meetingId == meetingId) return;

    if (jitsi != null) {
      VideoMeetingService.meetingId = null;
      VideoMeetingService.timer?.cancel();
      await jitsi?.leaveMeeting();
      await Future.delayed(const Duration(seconds: 2));
    }
    VideoMeetingService.meetingId = meetingId;
    String displayName = callerName ?? '';
    SharedStorage.writeIsInCall(true);
    jitsi = Jitsi(
        roomText: roomText,
        nameText: displayName,
        serverUrl: serverUrl,
        onLeave: () async {
          await Future.delayed(const Duration(seconds: 5));
          SharedStorage.writeIsInCall(false);
          try {
            ///todo
            jitsi = null;
            VideoMeetingService.meetingId = null;
            VideoMeetingService.timer?.cancel();
          } catch (e) {}
        },
        subjectText: '');

    jitsi?.joinMeeting();

    if (timeToLeave != null) {
      timer = CountdownTimer(
        Duration(seconds: timeToLeave),
        const Duration(seconds: 1),
      );
    }
  }

  static leaveMeeting(FCMNotificationModel fcm) async {
    try {
      VideoMeetingService.timer?.cancel();
    } on Exception {}
  }
}
