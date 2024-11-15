import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:ministries_reception_app/core/notification/notification.dart';
import 'package:ministries_reception_app/core/utils/service_locator.dart';

import 'core/constants/constant.dart';
import 'core/notification/data/fcm_notification_model.dart';
import 'core/notification/domin/notification_middleware.dart';
import 'core/notification/signal_r.dart';
import 'core/utils/custom_easy_loading.dart';
import 'core/utils/shared_storage.dart';
import 'my_app.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:wakelock/wakelock.dart';
Future<void> main() async {
  if(!kIsWeb)
  {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }

  await SharedStorage.init();


  if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
    await Messaging.initFCM();
  }
  if (SharedStorage.hasToken()) {
    await SignalR().start(onReceived: (data) {
      var notification = FCMNotificationModel.fromSignalR(data as Map<String, dynamic>);
      NotificationMiddleware.onRceived(notification);

    });
  }
  ServiceLocator.registerModels();


  if(!kIsWeb)
  {if (!Platform.isWindows) await AppConstant.getDefaultLanguage();}
  Wakelock.enable();

  runApp(
    EasyLocalization(
      supportedLocales: AppConstant.languages.values.toList(),
      path: 'assets/locales',
      fallbackLocale: const Locale('ar'),
      startLocale: Locale(SharedStorage.getLanguage()),
      saveLocale: true,
      child: Phoenix(child: MyApp()),
    ),
  );
  CustomEasyLoading.configLoading();
}
