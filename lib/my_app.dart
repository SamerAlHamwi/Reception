import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/features/standby/presentation/standby_page.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_settings.dart';
import 'core/constants/app_theme.dart';
import 'core/utils/shared_storage.dart';
import 'core/widgets/easy_loading.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/call_reception/presentation/pages/welcome_call_reception_page.dart';
import 'features/select_unit_journy/presentation/pages/welcome_reception_page.dart';
import 'features/unit_screen/presentation/pages/unit_screen_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'features/video_call_screen/presentation/pages/video_call_page.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static getNextPage() {
    if (SharedStorage.hasToken()) {
      if (SharedStorage.getUserType() == 1) {
        return const WelcomeReceptionPage();
      }
      if (SharedStorage.getUserType() == 3) {
        return UnitScreenPage();
      }
      if (SharedStorage.getUserType() == 4) {
        return const StandByPage();
      }
      if (SharedStorage.getUserType() == 5) {
        return const WelcomeCallReceptionPage();
      }
    } else {
      return LoginPage();
    }
  }
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _streamSubscription;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//for hide status and bottom Navigation Bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    EasyLoadingClass.getStyleEasyLoading();
    return Theme(
      data: AppTheme.appTheme,
      child: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          navigatorKey: Keys.navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: AppConstant.languages.values.toList(),
          builder: EasyLoading.init(),
          locale: context.locale,
          title: AppSettings.appName,
          home: // LoginPage(),
              MyApp.getNextPage(),
          material: (_, __) => MaterialAppData(
              scrollBehavior: AppScrollBehavior(),
              theme: AppTheme.appTheme,
              debugShowCheckedModeBanner: AppSettings.isDebug),
          cupertino: (_, __) => CupertinoAppData(
            scrollBehavior: AppScrollBehavior(),
            theme: AppTheme.appThemeCupertino,
            debugShowCheckedModeBanner: AppSettings.isDebug,
          ),
        ),
      ),
    );
  }
}
