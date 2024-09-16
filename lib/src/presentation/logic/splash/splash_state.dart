import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class Initial extends SplashState {}

class Loading extends SplashState {}

class Loaded extends SplashState {}
