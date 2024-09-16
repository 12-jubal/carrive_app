import 'package:carrive_app/src/data/models/user.dart';

class Data {
  late final String id;
  late final int code;
  late final DateTime expirationDate;
  late final bool isOk;
  late final User user;

  Data({
    required this.id,
    required this.code,
    required this.expirationDate,
    required this.isOk,
    required this.user,
  });

  // Method permitting the conversion of a JSON object to a Data object
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      code: json['code'],
      expirationDate: DateTime.parse(json['expirationDate']),
      isOk: json['isOk'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['expirationDate'] = expirationDate;
    data['isOk'] = isOk;
    data['user'] = user;
    return data;
  }
}
