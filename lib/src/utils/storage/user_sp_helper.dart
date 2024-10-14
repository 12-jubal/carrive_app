import 'dart:convert';

import 'package:carrive_app/src/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferencesHelper {
  // Singleton pattern
  UserSharedPreferencesHelper._();

  static const String userKey = 'user';

  // Save user information as a JSON string
  static Future<void> saveUser({required String userJson}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, userJson);
  }

  // Get user information as a JSON string
  static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKey);
  }

  // Get user information as a User object
  static Future<User?> getUserObject() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(userKey);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  // Clear user information
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }
}
