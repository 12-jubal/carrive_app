abstract class OTPState {}

class OTPInitial extends OTPState {}

class OTPLoading extends OTPState {}

class OTPError extends OTPState {}

class OTPSuccess extends OTPState {}

class OTPTimeUpdate extends OTPState {
  final String remainingTime;

  OTPTimeUpdate({required this.remainingTime});
}
