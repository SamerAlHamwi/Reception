import 'package:flutter/foundation.dart';

class ApiURLs {

  ///BASE_URL dev
  static const String baseUrl = 'https://ministrieapidev.metasignapp.com/api/';

  ///BASE_URL staging
 // static const String baseUrl = '';

  static const String loginURL = baseUrl + 'TokenAuth/Authenticate';
  static const String getClientsRequestsURL = baseUrl + 'services/app/ClientRequest/GetAll';


}

