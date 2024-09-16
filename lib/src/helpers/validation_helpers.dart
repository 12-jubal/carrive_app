import 'package:carrive_app/src/utils/constants/enums.dart';

class ValidationHelpers {
  ValidationHelpers._();

  // Function to validate email
  static ValidationType validateEmail({required String email}) {
    if (email.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
            .hasMatch(email)) {
      return ValidationType.invalid; // Not valid
    }
    return ValidationType.valid; // Valid
  }

  // Function to validate password
  static ValidationType validatePassword({required String password}) {
    // checks for uppercase and symbols in password fields
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasSymbol = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (password.isEmpty ||
        !hasUppercase ||
        !hasSymbol ||
        password.length < 8) {
      return ValidationType.invalid; // Not valid
    }
    return ValidationType.valid; // Valid
  }

  // Create a function to validate name
  static ValidationType validateName({required String name}) {
    if (name.isEmpty ||
        !RegExp(r'^[a-z A-Z 0-9._-]+$').hasMatch(name) ||
        name.length < 4) {
      return ValidationType.invalid; // Not valid
    }
    return ValidationType.valid; // Valid
  }
}
