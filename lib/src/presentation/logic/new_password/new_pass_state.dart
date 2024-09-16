import '../../../utils/constants/enums.dart';

abstract class NewPasswordState {}

class NewPasswordInitial extends NewPasswordState {}

class NewPasswordError extends NewPasswordState {
  final String message;

  NewPasswordError({required this.message});
}

class NewPasswordLoading extends NewPasswordState {}

class NewPasswordInvalid extends NewPasswordState {
  final ValidationType passwordValidationType;
  final ValidationType confirmPasswordValidationType;

  NewPasswordInvalid({
    required this.passwordValidationType,
    required this.confirmPasswordValidationType,
  });
}

class NewPasswordSuccess extends NewPasswordState {}
