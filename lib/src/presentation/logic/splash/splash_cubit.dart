import 'package:carrive_app/src/presentation/logic/splash/splash_state.dart';
import 'package:carrive_app/src/utils/storage/user_sp_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(Initial());

  Future<void> setRoot() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(Loading());
    try {
      // Retrieve the stored user data from SharedPreferences
      final user = await UserSharedPreferencesHelper.getUserObject();

      if (user != null) {
        await Future.delayed(const Duration(seconds: 3));
        emit(HomeLoaded(user)); // User exists
      } else {
        await Future.delayed(const Duration(seconds: 3));
        emit(WelcomeLoaded()); // No user found
      }
    } catch (error) {
      emit(SplashScreenError(error.toString()));
    }
  }
}
