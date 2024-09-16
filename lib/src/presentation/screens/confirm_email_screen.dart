import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/confirm_email/confirm_email_cubit.dart';
import 'package:carrive_app/src/presentation/logic/confirm_email/confirm_email_state.dart';
import 'package:carrive_app/src/utils/components/auth_header.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmEmailScreen extends StatelessWidget {
  final User user;
  const ConfirmEmailScreen({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmEmailCubit(user),
      child: BlocConsumer<ConfirmEmailCubit, ConfirmEmailState>(
        listener: ((context, state) {
          if (state is ConfirmEmailSuccess) {
            // Show a success message
            CustomToast.showUserTypeToast(
              type: ToastType.success,
              message: "Email confirmed successfully",
            );
            // Redirect to the next page
            // AppNavigator.pushReplacement(
            //   context,
            //   const HomeScreen(),
            // );
          } else if (state is ConfirmEmailError) {
            // Show an error message
            CustomToast.showUserTypeToast(
              type: ToastType.error,
              message: "An error occurred while confirming the email",
            );
          }
        }),
        builder: (context, state) {
          final cubit = context.read<ConfirmEmailCubit>();
          String timeText = "10:00"; // Default time text
          if (state is ConfirmEmailTimeUpdate) {
            timeText =
                state.remainingTime; // Update the time text from the state
          }
          return CustomScreen(
            isLoading: state is ConfirmEmailLoading,
            loadingMessage: state is ConfirmEmailLoading ? state.message : "",
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
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
                              title: "Confirm Email",
                              subtitle: "Please confirm your email address",
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
                            const Spacing(height: 20),
                            CustomPinput(
                              label: 'Confirmation Code',
                              pinController: cubit.confirmEmailController,
                            ),
                            const Spacing(height: 40),
                            CustomButton(
                              label: timeText == "00:00"
                                  ? "Resend Code"
                                  : "Confirm Email",
                              onTap: () {
                                if (timeText == "00:00") {
                                  cubit.restartTimer();
                                } else {
                                  cubit.confirmEmail();
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
          );
        },
      ),
    );
  }
}
