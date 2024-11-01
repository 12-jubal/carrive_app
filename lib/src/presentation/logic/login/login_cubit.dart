import 'dart:convert';

import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/data/services/auth_services.dart';
import 'package:carrive_app/src/presentation/logic/login/login_state.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/storage/user_sp_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  // Instantiate the TextEditingControllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit() : super(LoginInitial());

  // Create a function to validate Email and password
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

  // Listen to email changes and update validation type
  void onEmailChanged(String email) {
    final emailValidationType = validateEmail(email);
    emit(LoginInvalid(
      emailValidationType: emailValidationType,
      passwordValidationType: validatePassword(passwordController.text),
    ));
  }

  // Listen to password changes and update validation type
  void onPasswordChanged(String password) {
    final passwordValidationType = validatePassword(password);
    emit(LoginInvalid(
      emailValidationType: validateEmail(emailController.text),
      passwordValidationType: passwordValidationType,
    ));
  }

  Future<void> login({required BuildContext context}) async {
    final locale = AppLocalizations.of(context)!;
    // Get the email and password from the TextEditingControllers
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      emit(LoginError(message: locale.inputFields));
    } else if (validateEmail(email) == ValidationType.valid &&
        validatePassword(password) == ValidationType.valid) {
      emit(LoginLoading());
      try {
        // Call the login method from the AuthService
        User user = await AuthService.login(
          email: email,
          password: password,
        );
        if (user.isRegister == true) {
          // Convert User object to JSON string
          final userJson = jsonEncode(user.toJson());
          await UserSharedPreferencesHelper.saveUser(userJson: userJson);

          emit(LoginSuccess(user: user));
        } else {
          // Send User to Confirm Email Screen to confirm their email.
          emit(LoginError(message: "User not registered to confirm email"));
        }
      } catch (e) {
        emit(LoginError(message: e.toString()));
      }
    } else {
      emit(LoginInvalid(
        emailValidationType: validateEmail(email),
        passwordValidationType: validatePassword(password),
      ));
    }
  }

  // Dispose of the controllers
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
