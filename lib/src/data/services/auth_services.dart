import 'dart:developer';
import 'package:carrive_app/src/data/models/response.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/helpers/api_helpers.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

class AuthService {
  // Singleton pattern
  AuthService._();
  // method to convert our enum to a string
  static String userTypeToString(UserType userType) {
    switch (userType) {
      case UserType.driver:
        return 'DRIVER';
      case UserType.passenger:
        return 'PASSENGER';
      default:
        return 'NULL';
    }
  }

  // Method to register a user
  static Future<User> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassowrd,
    required UserType userType,
  }) async {
    User user;
    APIResponse apiResponse;
    try {
      // Call the API to register the user
      log('Calling API to register user');
      final response = await APIService.instance.request(
        endpoint: '/auth/sign-up',
        DioMethod.post,
        param: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassowrd,
          'userType': userTypeToString(userType),
        },
        contentType: 'application/json',
      );

      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        // Map Response to APIResponse class
        apiResponse = APIResponse.fromJson(jsonResponse);
        user = apiResponse.data!.user;
        return user;
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Method to confirm the email
  static Future<void> confirmEmail(String email, String code) async {
    try {
      // Call the API to confirm the email
      log('Calling API to confirm email');
      final response = await APIService.instance.request(
        endpoint: '/auth/confirm-email',
        DioMethod.post,
        param: {
          'email': email,
          'code': code,
        },
        contentType: 'application/json',
      );

      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        // Map Response to APIResponse class
        APIResponse apiResponse = APIResponse.fromJson(jsonResponse);
        // if (apiResponse.status == 'success') {
        //   return;
        // } else {
        //   throw Exception(apiResponse.message);
        // }
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
