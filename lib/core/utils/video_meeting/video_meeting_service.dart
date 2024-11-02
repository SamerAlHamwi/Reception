import 'package:flutter/services.dart';
import 'package:ministries_reception_app/core/constants/app_constants.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';
import 'package:ministries_reception_app/features/agora/presentation/agora_call_screen.dart';
import 'package:ministries_reception_app/features/select_unit_journy/presentation/pages/welcome_reception_page.dart';
import 'package:ministries_reception_app/features/unit_screen/presentation/pages/unit_screen_page.dart';
import 'package:quiver/async.dart';
import '../../../features/auth/presentation/pages/login_page.dart';
import '../../../features/call_reception/data/call_model.dart';
import '../../../features/call_reception/presentation/pages/welcome_call_reception_page.dart';
import '../../../features/main_unit/presentation/pages/main_unit_screen.dart';
import '../../../features/standby/presentation/standby_page.dart';
import '../../../features/unit_screen/presentation/pages/all_untis_screen.dart';
import '../../notification/data/fcm_notification_model.dart';

class VideoMeetingService {
  static CountdownTimer? timer;

  static startMeeting(
      {required Call call}) async {

    SharedStorage.writeIsInCall(true);
    Navigation.push(Keys.navigatorKey.currentContext!, VideoCallScreen(model: call));
  }

  static leaveMeeting() async {
    try {
      SharedStorage.writeIsInCall(false);
      Navigation.pushReplacement(Keys.navigatorKey.currentContext!, getNextPage());
    } on Exception {}
  }

  static getNextPage() {
    if (SharedStorage.hasToken()) {
      if (SharedStorage.getUserType() == 1) {
        return const WelcomeReceptionPage();
      }
      else if (SharedStorage.getUserType() == 3) {
        return UnitScreenPage();
      }
      else if (SharedStorage.getUserType() == 4) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return const StandByPage();
      }
      else if (SharedStorage.getUserType() == 5) {
        return const WelcomeCallReceptionPage();
      }
      else if (SharedStorage.getUserType() == 6) {
        return const MainUnitScreen();
      }
      else if (SharedStorage.getUserType() == 7) {
        return const AllUnitsScreenPage();
      }
      else{
        return LoginPage();
      }

    }
    else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      return LoginPage();
    }
  }
}
