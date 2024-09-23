import 'package:carrive_app/src/data/models/user.dart';

class ConfirmEmailState {}

class ConfirmEmailInitial extends ConfirmEmailState {}

class ConfirmEmailLoading extends ConfirmEmailState {
  final String message;

  ConfirmEmailLoading({required this.message});
}

class ConfirmEmailSuccess extends ConfirmEmailState {
  final User user;

  ConfirmEmailSuccess({required this.user});
}

class ConfirmEmailError extends ConfirmEmailState {
  final String message;

  ConfirmEmailError({required this.message});
}

class ConfirmEmailTimeUpdate extends ConfirmEmailState {
  final String remainingTime;

  ConfirmEmailTimeUpdate({required this.remainingTime});
}
