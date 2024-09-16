import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/enums.dart';
import 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeState());

  void selectUserType(UserType type) {
    emit(state.copyWith(selectedType: type));
    debugPrint('Selected user type: $type');
  }
}
