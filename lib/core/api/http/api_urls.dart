import 'package:flutter/foundation.dart';

class ApiURLs {

  ///BASE_URL dev
  static const String baseUrl = 'https://ministrieapidev.metasignapp.com/api/';

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
  static const String notitfyScreenUrl = baseUrl + 'services/app/Call/NotifyScreenToJoin';
  static const String CancleCallRequestUrl = baseUrl + 'services/app/Call/CancleRequest';
  static const String getDepartmentByIdURL = baseUrl + 'services/app/Department/Get';



}

