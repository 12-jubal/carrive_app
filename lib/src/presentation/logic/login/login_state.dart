import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({required this.user});
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}

class LoginInvalid extends LoginState {
  final ValidationType? emailValidationType;
  final ValidationType? passwordValidationType;
  LoginInvalid({
    this.emailValidationType,
    this.passwordValidationType,
  });
}
