import 'package:absolute_stay/animatedbox/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class File_server{

  // set Local Data
  static setLDB(String key,String value) async {
     SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString(key, value);
  }


  // Clear All Local Data && Logout
  static void clearAllLDB() async {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>const LoginScreen(),));
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }


  // Retrieve Local Data
  static Future<String> getLDB(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return Future.value(pref.getString(key) ?? '');
  }


}