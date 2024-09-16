import '../../../utils/constants/enums.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordValid extends ForgotPasswordState {
  final ValidationType emailValidationType;

  ForgotPasswordValid({required this.emailValidationType});
}

class ForgotPasswordError extends ForgotPasswordState {}
