import 'package:carrive_app/src/presentation/logic/new_password/new_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/enums.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  NewPasswordCubit() : super(NewPasswordInitial());

  // Create a function to validate password
  ValidationType validatePassword(String password) {
    // checks for uppercase and symbols in password fields
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasSymbol = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (password.isEmpty) {
      return ValidationType.invalid; // Not valid
    }
    if (!hasUppercase || !hasSymbol || password.length < 8) {
      return ValidationType.invalid; // Not valid
    }
    return ValidationType.valid; // Valid
  }

  // Listen to password changes and update validation type
  void onPasswordChanged(String password) {
    final passwordValidationType = validatePassword(password);
    emit(NewPasswordInvalid(
        passwordValidationType: passwordValidationType,
        confirmPasswordValidationType:
            validatePassword(confirmPasswordController.text)));
  }

  // Listen to confirm password changes and update validation type
  void onConfirmPasswordChanged(String password) {
    final confirmPasswordValidationType = validatePassword(password);
    emit(NewPasswordInvalid(
        passwordValidationType: validatePassword(newPasswordController.text),
        confirmPasswordValidationType: confirmPasswordValidationType));
  }

  void resetPassword() {
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      emit(NewPasswordError(message: 'Please input all fields'));
      return;
    } else if (newPassword != confirmPassword) {
      emit(NewPasswordError(message: 'Passwords do not match'));
      return;
    } else {
      emit(NewPasswordLoading());
      Future.delayed(const Duration(seconds: 3), () {
        emit(NewPasswordSuccess());
      });
    }
  }

  // Dispose of the controllers
  @override
  Future<void> close() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
