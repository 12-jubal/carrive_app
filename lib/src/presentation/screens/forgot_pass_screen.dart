import 'package:carrive_app/src/presentation/logic/forgot_password/forgot_password_cubit.dart';
import 'package:carrive_app/src/presentation/logic/forgot_password/forgot_password_state.dart';
import 'package:carrive_app/src/utils/components/auth_header.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/widgets/custom_back.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_navigator.dart';
import '../../utils/spacing.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              // Show a success message
              CustomToast.showUserTypeToast(
                type: ToastType.success,
                message: "Verification code sent successfully",
              );
              // Redirect to OTP page
              AppNavigator.pushReplacement(context, const OTPScreen());
            } else if (state is ForgotPasswordError) {
              // Show an error message
              CustomToast.showUserTypeToast(
                type: ToastType.error,
                message: "Please input a valid email",
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<ForgotPasswordCubit>();
            return CustomScreen(
              isLoading: state is ForgotPasswordLoading,
              loadingMessage: "Sending Verification Code",
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Spacing(height: 10),
                                const AuthHeader(
                                  title: "Forgot Password",
                                  subtitle:
                                      "You will receive an email from us to which you will receive directives on how to create a new password.",
                                ),
                                const Spacing(height: 20),
                                Form(
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        label: 'Email',
                                        hint: 'johndoe@gmail.com',
                                        onChanged: cubit.onEmailChanged,
                                        textEditingController:
                                            cubit.emailController,
                                        validationType:
                                            state is ForgotPasswordValid
                                                ? state.emailValidationType
                                                : null,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacing(height: 20),
                                CustomButton(
                                  onTap: () {
                                    cubit.forgotPassword();
                                  },
                                  label: 'Receive Code',
                                ),
                                const Spacing(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
