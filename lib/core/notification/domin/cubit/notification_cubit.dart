import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/core_models/empty_model.dart';
import '../../../../core/notification/data/fcm_notification_model.dart';
import '../../../../core/notification/domin/notification_middleware.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;

import '../../notification.dart';
import '../../signal_r.dart';
import '../repository/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static Future<bool> updateFCMToken(String? token) async {
    startSignalR();
    var response = await NotificationRepository.updateFCMToken(token);
    return response is EmptyModel;
  }

  static Future<bool> removeFCMToken() async {
    var response = await NotificationRepository.updateFCMToken(null);
    return response is EmptyModel;
  }

  static startSignalR() {
    if (
        // Platform.isIOS ||
        Messaging.token == null) {
      SignalR().start(onReceived: (data) {
        var notification =
            FCMNotificationModel.fromJson(data as Map<String, dynamic>);
        NotificationMiddleware.onRceived(notification);
      });
    }
  }
}
