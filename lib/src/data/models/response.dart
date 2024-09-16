import 'package:carrive_app/src/data/models/data.dart';

class APIResponse {
  late final String message;
  late final int code;
  late final Data? data;

  APIResponse({
    required this.message,
    required this.code,
    required this.data,
  });

  // Method permitting the conversion of a JSON object to an APIResponse object
  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      message: json['message'],
      code: json['code'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['data'] = data;
    return data;
  }
}
