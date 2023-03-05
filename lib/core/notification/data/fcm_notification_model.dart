import '../../constants/app_constants.dart';

class FCMNotificationModel {
  String? id;
  String? notificationName;
  NotificationType? type;
  String? message;
  String? serverLink;
  String? room;
  String? dateTime;
  int? relatedId;
  NotificationType? state;
  String? callId;

  FCMNotificationModel(
      {this.id,
      this.notificationName,
      this.type,
      this.message,
      this.dateTime,
      this.relatedId,
      this.state});

  FCMNotificationModel.fromJson(Map<String, dynamic> json) {
    print(json);
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['room'] != null) {
      room = json['room'];
    }
    if (json['serverLink'] != null) {
      serverLink = json['serverLink'];
    }
    if (json['notificationName'] != null) {
      notificationName = json['notificationName'];
    }
    if (json['type'] != null) {
      type = NotificationType.values[int.parse(json['type'])];
    }
    if (json['callId'] != null) {
      callId = json['callId'];
    }
    if (json['message'] != null) {
      message = json['message'];
    }
    if (json['dateTime'] != null) {
      dateTime = json['dateTime'];
    }
    if (json['relatedId'] != null) {
      relatedId = json['relatedId'];
    }
  }

  FCMNotificationModel.fromFCM(Map<String, dynamic> json) {
    if (json['type'] != null) {
      type = NotificationType.values[int.parse(json['type'])];
    }
    if (json['relatedId'] != null) {
      relatedId = int.parse(json['relatedId']);
    }
    if (json['time'] != null) {
      dateTime = json['time'];
    }
  }

  FCMNotificationModel.fromSignalR(Map<String, dynamic> json) {
    serverLink = json['notification']['data']['properties']['ServerLink'];
    room = json['notification']['data']['properties']['Room'];
    type = NotificationType.values.firstWhere((element) => element
        .toString()
        .toLowerCase()
        .contains(
        json['notification']['notificationName'].toString().toLowerCase()));
    print(type);
    print('Hamodinan');


  }
}
