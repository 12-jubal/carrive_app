import 'dart:async';

import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/confirm_email/confirm_email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  final TextEditingController confirmEmailController = TextEditingController();

  late Timer myTimer;
  // int remainingSeconds = 600; // 10 minutes 00 seconds
  int remainingSeconds = 600;
  final User user;

  ConfirmEmailCubit(this.user) : super(ConfirmEmailInitial()) {
    startTimer();
  }

  // start the timer
  startTimer() {
    const oneSec = Duration(seconds: 1);
    myTimer = Timer.periodic(oneSec, (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        remainingSeconds--;
        emit(ConfirmEmailTimeUpdate(
            remainingTime: formatTime(remainingSeconds)));
      }
    });
  }

  // We try to initialize once more the timer when the resend button is clicked
  restartTimer() {
    emit(ConfirmEmailLoading(message: 'Resending Code'));
    Future.delayed(const Duration(seconds: 3), () {
      remainingSeconds = 600;
      startTimer();
    });
  }

  // Helper function to format the time into mm:ss
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void confirmEmail() {
    final code = confirmEmailController.text;
    if (code.isEmpty || code.length != 5) {
      emit(ConfirmEmailError(message: "Fill the boxes"));
      return;
    }
    emit(ConfirmEmailLoading(message: 'Confirming Email'));
    // Call the API to confirm the email
    try {
      // await AuthServices.confirmEmail(user.email, code);
    } catch (e) {
      emit(ConfirmEmailError(message: e.toString()));
    }
    // Future.delayed(const Duration(seconds: 3), () {
    //   // If the email is confirmed successfully
    //   if (code == "123456") {
    //     emit(ConfirmEmailSuccess());
    //   } else {
    //     emit(ConfirmEmailError(message: 'Invalid Code'));
    //   }
    // });
  }
}
