import 'package:carrive_app/src/data/services/auth_services.dart';
import 'package:carrive_app/src/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/enums.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final TextEditingController emailController = TextEditingController();
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  // Create a function to validate Email
  ValidationType validateEmail(String email) {
    if (email.isEmpty) {
      return ValidationType.invalid; // Not valid
    }
    // regex to validate email
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return ValidationType.invalid; //Not Valid
    }
    return ValidationType.valid; // Valid
  }

  // Listen to email changes and update validation type
  void onEmailChanged(String email) {
    final emailValidationType = validateEmail(email);
    emit(ForgotPasswordValid(
      emailValidationType: emailValidationType,
    ));
  }

  void forgotPassword() async {
    final email = emailController.text;
    if (email.isEmpty || validateEmail(email) == ValidationType.invalid) {
      emit(ForgotPasswordError(message: "Please input a valid email"));
      return;
    } else if (validateEmail(email) == ValidationType.valid) {
      emit(ForgotPasswordLoading());
      // Check if the email is in our database and sends code
      try {
        await AuthService.receiveResetCode(email: email);
        emit(ForgotPasswordSuccess());
      } catch (e) {
        emit(ForgotPasswordError(message: e.toString()));
        return;
      }

      // Call the API to send the email
      Future.delayed(const Duration(seconds: 3), () {
        // If the email is sent successfully
        emit(ForgotPasswordSuccess());
        // If there is an error

        return;
      });
    }
  }

  // Dispose of the controllers
  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
