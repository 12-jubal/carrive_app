import 'package:carrive_app/src/utils/constants/enums.dart';

class User {
  late final String id;
  late final String name;
  late final String email;
  late final String? token;
  late final bool isActive;
  late final bool isConnected;
  // late final DateTime? registeredAt;
  late final UserType userType;
  // late final String? carId;
  // late final String? carMatricule;
  // late final String? carModel;
  // late final String? carColor;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.isActive,
    required this.isConnected,
    // required this.registeredAt,
    required this.userType,
    // this.carId,
    // this.carMatricule,
    // this.carModel,
    // this.carColor,
  });

  UserType typeFromString(String usertype) {
    if (usertype == 'DRIVER') {
      return UserType.driver;
    } else {
      return UserType.passenger;
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    isActive = json['isActive'];
    isConnected = json['isConnected'];
    // registeredAt = DateTime.parse(json['registeredAt']);
    userType = typeFromString(json['userType']);
    // carId = json['car_id'];
    // carMatricule = json['car_matricule'];
    // carModel = json['car_model'];
    // carColor = json['car_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['token'] = token;
    data['isActive'] = isActive;
    data['isConnected'] = isConnected;
    // data['registeredAt'] = registeredAt;
    data['userType'] = userType;
    // data['car_id'] = carId;
    // data['car_matricule'] = carMatricule;
    // data['car_model'] = carModel;
    // data['car_color'] = carColor;
    return data;
  }

  // @override
  // String toString() {
  //   return 'User{id: $id, name: $name, email: $email, token: $token, isActive: $isActive, isConnected: $isConnected, userType: $userType, carId: $carId, carMatricule: $carMatricule, carModel: $carModel, carColor: $carColor}';
  // }
}
