import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'otp_state.dart';

class OTPCubit extends Cubit<OTPState> {
  final TextEditingController otpController = TextEditingController();

  late Timer myTimer;
  int remainingSeconds = 600; // 10 minutes 00 seconds

  OTPCubit() : super(OTPInitial()) {
    startTimer(); // Start the timer when the cubit is created
  }

  // start the timer
  startTimer() {
    const oneSec = Duration(seconds: 1);
    myTimer = Timer.periodic(oneSec, (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        remainingSeconds--;
        emit(OTPTimeUpdate(remainingTime: formatTime(remainingSeconds)));
      }
    });
  }

  // Helper function to format the time into mm:ss
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void verifyOTP() {
    final otp = otpController.text;
    if (otp.isEmpty || otp.length != 6) {
      emit(OTPError());
      return;
    }
    emit(OTPLoading());
    Future.delayed(const Duration(seconds: 3), () {
      if (otp == "123456") {
        emit(OTPSuccess());
      } else {
        emit(OTPError());
      }
    });
  }

  // Dispose of the controller and timer
  @override
  Future<void> close() {
    otpController.dispose();
    myTimer.cancel(); // Cancel the timer when the cubit is disposed
    return super.close();
  }
}
