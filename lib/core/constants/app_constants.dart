import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:devicelocale/devicelocale.dart';

class Keys {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldKey = GlobalKey<ScaffoldState>();
}

class AppConstant {
  static const List requestColors = [
    Color(0x59cc38a1),
    Color(0x59386ccc),
    Color(0x5938cc44),
    Color(0x59cc3838),
    Color(0x59fffb1f),
  ];

  static const Map<String, Locale> languages = {
    'ar': Locale('ar'),
    'en': Locale('en'),
  };
  static Locale defaultLocal = Locale("en");

  static getDefaultLanguage() async {
    List? languages = await Devicelocale.preferredLanguages;
    defaultLocal = Locale(languages!.elementAt(0).toString().split("-")[0]);
    return defaultLocal;
  }
}

enum NotificationType {
  NULL,
  PushNotification,
  NewRequestHasPublished,
  NewCallRequestHasPublished,
  TheRequestHasTreated,
  YouShouldJoinCall,
  TheCallHasCanseld,
  YouShouldLeaveCall,
  ScreenLeaveCall,
  ScreenJoinCall,
}

// Headers
const HEADER_LANGUAGE = 'Accept-Language';
const HEADER_AUTH = 'authorization';
const HEADER_CONTENT_TYPE = 'Content-Type';
const HEADER_ACCEPT = 'accept';

class AppScrollBehavior extends MaterialScrollBehavior {
  /// just to provide scroll to web and windows
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
