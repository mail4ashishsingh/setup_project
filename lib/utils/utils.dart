import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static const String app_name = "SetupProject";
  static const String app_version = "version 1.0.0";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String google_san_family = "GoogleSans";
  static bool isDebug = false;

  //* Preferences
  static SharedPreferences prefs;
}
