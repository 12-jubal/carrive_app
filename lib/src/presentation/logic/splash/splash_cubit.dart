import 'package:carrive_app/src/presentation/logic/splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(Initial());

  Future<void> setRoot() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(Loading());
    await Future.delayed(const Duration(seconds: 3));
    emit(Loaded());
  }
}
