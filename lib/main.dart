import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'core/constants/constant.dart';
import 'core/notification/notification.dart';
import 'core/utils/custom_easy_loading.dart';
import 'core/utils/shared_storage.dart';
import 'core/widgets/easy_loading.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/select_unit_journy/presentation/pages/welcome_page.dart';
import 'features/unit_screen/presentation/pages/unit_screen_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedStorage.init();
// Enter fullscreen

  // if (Platform.isWindows) await WindowManager.instance.setFullScreen(true);
  if (!Platform.isWindows) await AppConstant.getDefaultLanguage();
   Messaging.initFCM();
  runApp(
    EasyLocalization(
      child: Phoenix(child: MyApp()),
      supportedLocales: AppConstant.languages.values.toList(),
      path: 'assets/locales',
      fallbackLocale: const Locale('ar'),
      startLocale: Locale(SharedStorage.getLanguage()),
      saveLocale: true,
    ),
  );
  CustomEasyLoading.configLoading();
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
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
    // to hide only status bar:
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    // // to hide only bottom bar:
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
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
          home:// LoginPage(),
              _getNextPage(),
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

  _getNextPage() {
    if (SharedStorage.hasToken()) {
      if (SharedStorage.getUserType() == 1) {
        return WelcomePage();
      }
      if (SharedStorage.getUserType() == 3) {
        return UnitScreenPage();
      }
    } else {
      return LoginPage();
    }
  }
}
