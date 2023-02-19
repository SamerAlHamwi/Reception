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


}

