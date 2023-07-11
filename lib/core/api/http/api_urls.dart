import 'package:flutter/foundation.dart';

class ApiURLs {

  ///BASE_URL dev
  static const String baseUrl ="https://ministrieapidev-dev.dev.itland-sy.com/api/"; //'https://ministrieapidev.metasignapp.com/api/';
  static const String baseUrl1 = 'https://ministrieapidev-dev.dev.itland-sy.com';

  ///BASE_URL staging
 // static const String baseUrl = '';

  static const String loginURL = baseUrl + 'TokenAuth/Authenticate';
  static const String getMyMinistriesURL = baseUrl + 'services/app/Ministry/GetMyMinistry';
  static const String getMinistriesByIdURL = baseUrl + 'services/app/Ministry/Get';
  static const String getDisabilityCategoryURL = baseUrl + 'services/app/DisabilityCategory/GetAll';
  static const String createClientRequestUrl = baseUrl + 'services/app/ClientRequest/Create';
  static const String getClientsRequestsURL = baseUrl + 'services/app/ClientRequest/GetAll';
  static const String getRequestById = baseUrl + 'services/app/ClientRequest/Get';
  static const String updateClientRequestUrl = baseUrl + 'services/app/ClientRequest/Update';
  static const String getConfigurationUrl = baseUrl + 'services/app/Configuration/Get';
  static const String getAllNotification =
      baseUrl + 'services/app/Notification/GetUserNotifications';
  static const String setTokenNotification =
      baseUrl + 'services/app/User/SetCurrentFcmToken';
  static const String getCalls = baseUrl + 'services/app/Call/GetAll';
  static const String createCall = baseUrl + 'services/app/Call/Create';
  static const String notifyScreenToJoinUrl = baseUrl + 'services/app/Call/NotifyScreenToJoin';
  static const String notifyScreenToLeaveUrl = baseUrl + 'services/app/Call/NotifyScreenToLeave';
  static const String CancleCallRequestUrl = baseUrl + 'services/app/Call/CancleRequest';
  static const String getDepartmentByIdURL = baseUrl + 'services/app/Department/Get';
  static const String joinCall = baseUrl + 'services/app/Call/JoinCall';
  static const String leaveCall = baseUrl + 'services/app/Call/LeaveCall';





}

