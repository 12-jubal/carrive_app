import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:dio/dio.dart';

class APIService {
  APIService._();
  static final APIService instance = APIService._();

  String get baseUrl {
    return 'https://b6b6-41-202-207-5.ngrok-free.app';
  }

  Future<Response> request(
    DioMethod method, {
    required String endpoint,
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
