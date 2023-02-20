

import '../../../core/api/core_models/base_result_model.dart';

class NotificationListResponseModel extends BaseResultModel {
  List<Notification>? notifications;
  int? totalCount;

  NotificationListResponseModel({this.notifications, this.totalCount});

  NotificationListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      notifications = [];
      json['items'].forEach((v) {
        notifications!.add(new Notification.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['items'] = this.notifications!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Notification {
  String? id;
  String? notificationName;
  int? type;
  String? message;
  String? dateTime;
  int? state;

  Notification(
      {this.id,
        this.notificationName,
        this.type,
        this.message,
        this.dateTime,
        this.state});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationName = json['notificationName'];
    type = json['type'];
    message = json['message'];
    dateTime = json['dateTime'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notificationName'] = this.notificationName;
    data['type'] = this.type;
    data['message'] = this.message;
    data['dateTime'] = this.dateTime;
    data['state'] = this.state;
    return data;
  }
}