import 'package:carrive_app/src/presentation/logic/otp/otp_cubit.dart';
import 'package:carrive_app/src/presentation/logic/otp/otp_state.dart';
import 'package:carrive_app/src/presentation/screens/new_pass_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/components/auth_header.dart';
import '../../utils/constants/enums.dart';
import '../../utils/widgets/custom_back.dart';
import '../../utils/widgets/custom_buttons.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPCubit(),
      child: BlocConsumer<OTPCubit, OTPState>(
        listener: ((context, state) {
          if (state is OTPSuccess) {
            // Show a success message
            CustomToast.showUserTypeToast(
              type: ToastType.success,
              message: "OTP verified successfully",
            );
            // Redirect to the next page
            AppNavigator.pushReplacement(
              context,
              NewPasswordScreen(
                user: state.user,
              ),
            );
          } else if (state is OTPError) {
            // Show an error message
            CustomToast.showUserTypeToast(
              type: ToastType.error,
              message: state.message,
            );
          }
        }),
        builder: (context, state) {
          final cubit = context.read<OTPCubit>();
          String timeText = "10:00"; // Default time text
          if (state is OTPTimeUpdate) {
            timeText =
                state.remainingTime; // Update the time text from the state
          }
          return CustomScreen(
            isLoading: state is OTPLoading,
            loadingMessage: "Verifying OTP",
            child: CustomScreen(
              isLoading: state is OTPLoading,
              loadingMessage: state is OTPLoading ? state.message : '',
              child: Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 24.h,
                        left: 24.w,
                        child: const CustomBackButton(),
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 60.h,
                            left: 24.w,
                            right: 24.w,
                          ),
                          child: Column(
                            children: [
                              const AuthHeader(
                                title: "Verify OTP",
                                subtitle: "Enter the OTP sent to your email",
                              ),
                              const Spacing(height: 8),
                              Text(
                                timeText == '00:00'
                                    ? "Code Expired"
                                    : "Code Expires in $timeText",
                                style: AppTextStyles.body2.copyWith(
                                  color: AppColors.redSource,
                                ),
                              ),
                              const Spacing(height: 22),
                              CustomPinput(
                                label: 'OTP Code',
                                pinController: cubit.otpController,
                              ),
                              const Spacing(height: 40),
                              CustomButton(
                                label: timeText == "00:00"
                                    ? "Resend Code"
                                    : "Verify OTP",
                                onTap: () {
                                  if (timeText == "00:00") {
                                    cubit.restartTimer();
                                  } else {
                                    cubit.verifyOTP();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
