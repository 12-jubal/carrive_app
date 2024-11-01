import 'package:carrive_app/src/utils/constants/enums.dart';

class ConvertionHelpers {
  ConvertionHelpers._();

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
}
