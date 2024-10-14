import 'package:carrive_app/src/data/models/user.dart';

class SplashState {}

class Initial extends SplashState {}

class Loading extends SplashState {}

class WelcomeLoaded extends SplashState {}

class HomeLoaded extends SplashState {
  final User user;

  HomeLoaded(this.user);
}

class SplashScreenError extends SplashState {
  final String message;

  SplashScreenError(this.message);
}
