import 'dart:developer';
import 'dart:io';

import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/storage/user_sp_helper.dart';
import 'package:dio/dio.dart';

class APIService {
  APIService._();
  static final APIService instance = APIService._();

  String get baseUrl {
    return 'http://192.168.1.198:8085';
  }

  Future<Response> request(
    DioMethod method, {
    required String endpoint,
    bool requiresToken = false,
    myBaseUrl,
    Map<String, dynamic>? param,
    String? contentType,
    formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: myBaseUrl ?? baseUrl,
          contentType: contentType ?? Headers.jsonContentType,
          // headers: {
          //   HttpHeaders.authorizationHeader: 'Bearer $token',
          // },
        ),
      );
      // Add authorization header if required
      if (requiresToken) {
        // Retrieve the stored user data from SharedPreferences
        final user = await UserSharedPreferencesHelper.getUserObject();
        String? token = user!.token;
        log('USER_TOKEN: $token');

        if (token != null) {
          // log("USER_TOKEN: $token");
          dio.options.headers[HttpHeaders.authorizationHeader] =
              'Bearer $token';
        }
      }
      switch (method) {
        case DioMethod.post:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return dio.delete(
            endpoint,
            data: param ?? formData,
          );
        default:
          return dio.post(
            endpoint,
            data: param ?? formData,
          );
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
