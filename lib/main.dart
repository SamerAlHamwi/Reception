import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'core/constants/constant.dart';
import 'core/utils/custom_easy_loading.dart';
import 'core/utils/shared_storage.dart';
import 'my_app.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedStorage.init();

  if (!Platform.isWindows) await AppConstant.getDefaultLanguage();
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
