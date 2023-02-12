import 'dart:ui';

import 'package:get_storage/get_storage.dart';


class SharedStorage {
  static String storageName = 'scs_container';
  static GetStorage box = GetStorage(storageName);
  static String tokenKey = 'token';
  static String languageKey = 'language';
  static String idGameKey = 'idGame';
  static String nameGameKey = 'nameGame';
  static String statusGameKey = 'statusGame';
  static String firstTimeKey = 'firstTime';
  static String isNewUser = "isNewUser";
  static String isSeeIntroCard = "false";



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
  static hasId() {
    if (box.hasData(idGameKey)) {
      return true;
    } else {
      return false;
    }
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
  static getNameGame() {
    return box.read(nameGameKey) ??"";
  }

  static writeNameGame(value) {
    box.write(nameGameKey, value);
  }
  static getIdGame() {
    return box.read(idGameKey);
  }

  static writeIdGame(value) {
    box.write(idGameKey, value);
  }

  static removeGameId() {
    box.remove(idGameKey);
  }
  static getStatusGame() {
    return box.read(statusGameKey)??0 ;
  }

  static writeStatusGame(value) {
    box.write(statusGameKey, value);
  }


  static getFirstTime() {
    return box.read(firstTimeKey);
  }

  static writeFirstTime(value) {
    box.write(firstTimeKey, value);
  }

  static writeIsNewUser(isNew) {
    box.write(isNewUser, isNew);
  }

  static getIsNewUser() {
    if (box.hasData(isNewUser)) {
      return false;
    } else {
      return true;
    }
  }
  static writeisSawIntoCard(saw) {
    box.write(isSeeIntroCard, saw);
  }

  static getisSeeIntroCard() {
    if (box.hasData(isSeeIntroCard)) {
      return true;
    } else {
      return false;
    }
  }




}
