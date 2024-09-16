import 'package:carrive_app/src/utils/constants/enums.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {}

class LoginInvalid extends LoginState {
  final ValidationType? emailValidationType;
  final ValidationType? passwordValidationType;
  LoginInvalid({
    this.emailValidationType,
    this.passwordValidationType,
  });
}
