import 'dart:async';

import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/data/services/auth_services.dart';
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

  // We try to initialize once more the timer when the resend button is clicked
  restartTimer() {
    emit(OTPLoading(message: 'Resending Code'));
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

  void verifyOTP() async {
    final otp = otpController.text;
    if (otp.isEmpty || otp.length != 5) {
      emit(OTPError(message: 'Fill in the OTP'));
      return;
    }
    emit(OTPLoading(message: 'Verifying OTP'));
    try {
      User user = await AuthService.validateReset(code: otp);
      myTimer.cancel();
      emit(OTPSuccess(user: user));
    } catch (e) {
      emit(OTPError(message: e.toString()));
    }
  }

  // Dispose of the controller and timer
  @override
  Future<void> close() {
    otpController.dispose();
    myTimer.cancel(); // Cancel the timer when the cubit is disposed
    return super.close();
  }
}
