import 'package:ministries_reception_app/core/api/core_models/base_result_model.dart';

import '../../../core/data/attachments_model.dart';

class Call extends BaseResultModel{
  int? id;
  String? screenJoinedDate;
  String? screenLeaveDate;
  int? departmentId;
  String? departmentName;
  String? callRequesterName;
  String? orderNumber;
  String? creationTime;
  int? numberOfCallMinutes;
  int? callStatus;
  String? channelName;
  String? agoraRtcToken;
  String? agoraAppId;
  int? userId;
  int? interpreterId;
  Leader? leader;
  bool? isCrossMeeting;
  Screen? screen;
  Attachments? attachment;

  Call(
      {this.id,
      this.departmentId,
      this.departmentName,
      this.callRequesterName,
      this.screenJoinedDate,
      this.screenLeaveDate,
      this.creationTime,
      this.orderNumber,
      this.numberOfCallMinutes,
      this.callStatus,
      this.channelName,
      this.agoraRtcToken,
      this.agoraAppId,
      this.userId,
      this.interpreterId,
      this.isCrossMeeting,
      this.leader,
      this.screen,
      this.attachment});

  Call.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;

    departmentName = json['departmentName'] ?? "";
    departmentId = json['departmentId'] ?? 0;
    callRequesterName = json['callRequesterName'] ?? "";

    screenJoinedDate = json['screenJoinedDate'];
    creationTime = json['creationTime'];
    orderNumber = json['orderNumber'];
    screenLeaveDate = json['screenJoinedDate'];
    isCrossMeeting = json['isCrossMeeting'];
    numberOfCallMinutes = json['numberOfCallMinutes'] ?? 0;
    callStatus = json['callStatus'] ?? 0;
    userId = json['userId'] ?? 0;
    interpreterId = json['interpreterId'] ?? 0;
    callStatus = json['callStatus'] ?? 0;
    channelName = json['channelName'] ?? '';
    agoraRtcToken = json['agoraRtcToken'] ?? '';
    agoraAppId = json['agoraAppId'] ?? '';

    if (json['leader'] != null) {
      leader = Leader.fromJson(json['leader']);
    }
    if (json['screen'] != null) {
      screen = Screen.fromJson(json["screen"]);
    }
    if (json['attachment'] != null) {
      attachment = Attachments.fromJson(json["attachment"]);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['screenJoinedDate'] = screenJoinedDate;
    data['orderNumber'] = orderNumber;
    data['screenLeaveDate'] = screenLeaveDate;
    data['numberOfCallMinutes'] = numberOfCallMinutes;
    data['callStatus'] = callStatus;
    data['creationTime'] = creationTime;
    data['isCrossMeeting'] = isCrossMeeting;
    data['leader'] = leader;
    data['screen'] = screen;
    data['attachment'] = attachment;
    data['callRequesterName'] = callRequesterName;
    data['departmentId'] = departmentId;
    data['departmentName'] = departmentName;
    return data;
  }
}

class Leader {
  int? id;
  String? userName;
  String? name;
  String? userPosition;
  String? surname;
  String? emailAddress;
  bool? isActive;
  String? fullName;
  String? creationTime;
  int? userType;
  int? departmentId;

  Leader(
    this.id,
    this.userName,
    this.name,
    this.userPosition,
    this.surname,
    this.emailAddress,
    this.isActive,
    this.fullName,
    this.creationTime,
    this.userType,
    this.departmentId,
  );

  Leader.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userName = json['userName'] ?? '';
    name = json['name'] ?? '';
    userPosition = json['userPosition'] ?? '';
    surname = json['surname'] ?? '';
    emailAddress = json['emailAddress'] ?? '';
    isActive = json['isActive'] ?? false;
    fullName = json['fullName'] ?? '';
    creationTime = json['creationTime'] ?? DateTime.now();
    userType = json['userType'] ?? 0;
    departmentId = json['departmentId'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['name'] = name;
    data['userPosition'] = userPosition;
    data['surname'] = surname;
    data['emailAddress'] = emailAddress;
    data['isActive'] = isActive;
    data['fullName'] = fullName;
    data['creationTime'] = creationTime;
    data['userType'] = userType;
    data['departmentId'] = departmentId;
    return data;
  }
}

class Screen {
  int? id;
  String? userName;
  String? name;
  String? surname;
  String? emailAddress;
  bool? isActive;
  String? fullName;
  String? creationTime;
  int? userType;
  int? ministryId;

  Screen(
    this.id,
    this.userName,
    this.name,
    this.surname,
    this.emailAddress,
    this.isActive,
    this.fullName,
    this.creationTime,
    this.userType,
    this.ministryId,
  );

  Screen.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userName = json['userName'] ?? '';
    name = json['name'] ?? '';
    surname = json['surname'] ?? '';
    emailAddress = json['emailAddress'] ?? '';
    isActive = json['isActive'] ?? false;
    fullName = json['fullName'] ?? '';
    creationTime = json['creationTime'] ?? DateTime.now();
    userType = json['userType'] ?? 0;
    ministryId = json['ministryId'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['name'] = name;
    data['surname'] = surname;
    data['emailAddress'] = emailAddress;
    data['isActive'] = isActive;
    data['fullName'] = fullName;
    data['creationTime'] = creationTime;
    data['userType'] = userType;
    data['ministryId'] = ministryId;
    return data;
  }
}
