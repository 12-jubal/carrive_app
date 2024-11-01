import 'dart:developer';
import 'package:carrive_app/src/data/models/response.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/helpers/api_helpers.dart';
import 'package:carrive_app/src/helpers/convertion_helpers.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

class AuthService {
  // Singleton pattern
  AuthService._();

  String get authUrl {
    return 'https://f92d-154-72-162-124.ngrok-free.app';
  }

  // Method to login a user
  static Future<User> login({
    required String email,
    required String password,
  }) async {
    User user;
    // APIResponse apiResponse;
    try {
      // Call the API to login the user
      log('Calling API to login user');
      final response = await APIService.instance.request(
        myBaseUrl: AuthService._().authUrl,
        endpoint: '/auth/login',
        DioMethod.post,
        param: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = response.data['data'];
        // Map Response to User class
        user = User.fromJson(jsonResponse);
        return user;
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      // if (e is DioException) {
      //   log('DioException: ${e.toString()}');
      // }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  // Method to register a user
  static Future<User> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required UserType userType,
    String? idCar,
    String? matriculation,
    String? color,
    String? carModel,
  }) async {
    User user;
    APIResponse apiResponse;
    try {
      // Call the API to register the user
      log('Calling API to register user');
      final response = await APIService.instance.request(
        myBaseUrl: AuthService._().authUrl,
        endpoint: '/auth/sign-up',
        DioMethod.post,
        param: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'userType': ConvertionHelpers.userTypeToString(userType),
          'idCar': idCar,
          'matriculation': matriculation,
          'color': color,
          'carModel': carModel,
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = response.data;
        // Map Response to APIResponse class
        apiResponse = APIResponse.fromJson(jsonResponse);
        user = apiResponse.data!.user;
        return user;
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  // Method to confirm the email
  static Future<User> confirmEmail(String code) async {
    APIResponse apiResponse;
    User user;
    try {
      // Call the API to confirm the email
      log('Calling API to confirm email');
      final response = await APIService.instance.request(
        myBaseUrl: AuthService._().authUrl,
        endpoint: '/auth/valid-register?code=$code',
        DioMethod.post,
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

  // Method to send reset password code
  static Future<User> receiveResetCode({required String email}) async {
    User user;
    try {
      // Calling Forgot Password API
      log("Calling Forgot Password API");
      final response = await APIService.instance.request(
        myBaseUrl: AuthService._().authUrl,
        endpoint: '/auth/forgot-password?email=$email',
        DioMethod.post,
      );
      if (response.statusCode == 200) {
        var jsonResponse = response.data['data']['user'];
        // Map Response to User class
        user = User.fromJson(jsonResponse);
        return user;
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  // Method for the validation the reset code
  static Future<User> validateReset({required String code}) async {
    User user;
    try {
      // Call the API to resend the email
      log('Calling API to Validate Reset Code');
      final response = await APIService.instance.request(
        myBaseUrl: AuthService._().authUrl,
        endpoint: '/auth/validate-reset?code=$code',
        DioMethod.post,
      );

      if (response.statusCode == 200) {
        var jsonResponse = response.data['data']['user'];
        // Map Response to User class
        user = User.fromJson(jsonResponse);
        return user;
      } else {
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Method to reset the password of the user
  static Future<User> resetPasswords(
      {required String userId,
      required String password,
      required String confirmPassword}) async {
    User user;
    try {
      // Call the API to reset the password
      log('Calling API to reset password');
      final response = await APIService.instance.request(
        myBaseUrl: AuthService._().authUrl,
        endpoint:
            '/auth/reset-password?id=$userId&password=$password&confirm_password=$confirmPassword',
        DioMethod.post,
      );
      if (response.statusCode == 200) {
        var jsonresponse = response.data['data']['user'];
        user = User.fromJson(jsonresponse);
        return user;
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
