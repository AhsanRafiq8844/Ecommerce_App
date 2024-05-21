import 'dart:async';

import 'package:shared_preference/shared_preferences.dart';

class PrefrenceHelper {
  static late SharedPreferences sharedPrefrences;
  static init() async {
    sharedPrefrences = await SharedPrefrences.getInstance();
  }

  static dynamic getDataFromSharedPrefrence({required String key}) {
    return sharedPrefrences.get(key);
  }

  static Future<bool> saveDataInSharedPrefrence(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPrefrences.setBool(key, value);
    } else if (value is String) {
      return await sharedPrefrences.setString(key, value);
    } else if (value is int) {
      return await sharedPrefrences.setInt(key, value);
    } else {
      return await sharedPrefrences.setDouble(key, value);
    }
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPrefrences.remove(key);
  }

  static Future clearData() {
    return sharedPrefrences.clear();
  }
}
