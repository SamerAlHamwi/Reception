import 'dart:ui';

import 'package:get_storage/get_storage.dart';


class SharedStorage {
  static String storageName = 'scs_container';
  static GetStorage box = GetStorage(storageName);
  static String tokenKey = 'token';
  static String languageKey = 'language';
  static String userType = 'userType';




  static init() async {
    await GetStorage.init(storageName);
  }

  static hasToken() {
    if (box.hasData(tokenKey)) {
      return true;
    } else {
      return false;
    }
  }
  static writeUserType(value) {
   box.write(userType, value);
  }
  static getUserType() {
    return box.read(userType)??1;
  }
  static getToken() {
    return box.read(tokenKey);
  }

  static writeToken(value) {
    box.write(tokenKey, value);
  }

  static removeToken() {
    box.remove(tokenKey);
  }

  static getLanguage() {
    return box.read(languageKey) ??"ar";
  }

  static writeLanguage(value) {
    box.write(languageKey, value);
  }



}
