import 'package:carrive_app/src/data/models/car.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

class User {
  late final String id;
  late final String name;
  late final String email;
  late final String? token;
  late final bool isActive;
  late final bool isRegister;
  late final bool isConnected;
  late final UserType userType;
  late final List<Car> cars;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.isActive,
    required this.isConnected,
    required this.isRegister,
    required this.userType,
    required this.cars,
  });

  UserType typeFromString(String usertype) {
    if (usertype == 'DRIVER') {
      return UserType.driver;
    } else {
      return UserType.passenger;
    }
  }

  String typeToString(UserType usertype) {
    if (usertype == UserType.driver) {
      return 'DRIVER';
    } else {
      return 'PASSENGER';
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    isActive = json['isActive'];
    isConnected = json['isConnected'];
    isRegister = json['isRegister'];
    userType = typeFromString(json['userType']);
    cars =
        (json['cars'] as List).map((carJson) => Car.fromJson(carJson)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['token'] = token;
    data['isActive'] = isActive;
    data['isConnected'] = isConnected;
    data['isRegister'] = isRegister;
    data['userType'] = typeToString(userType);
    data['cars'] = cars;
    return data;
  }

  // @override
  // String toString() {
  //   return 'User{id: $id, name: $name, email: $email, token: $token, isActive: $isActive, isConnected: $isConnected, userType: $userType, carId: $carId, carMatricule: $carMatricule, carModel: $carModel, carColor: $carColor}';
  // }
}
