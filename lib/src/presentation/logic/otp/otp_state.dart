import 'package:carrive_app/src/data/models/user.dart';

abstract class OTPState {}

class OTPInitial extends OTPState {}

class OTPLoading extends OTPState {
  final String message;

  OTPLoading({required this.message});
}

class OTPError extends OTPState {
  final String message;

  OTPError({required this.message});
}

class OTPSuccess extends OTPState {
  final User user;

  OTPSuccess({required this.user});
}

class OTPTimeUpdate extends OTPState {
  final String remainingTime;

  OTPTimeUpdate({required this.remainingTime});
}
