import 'package:carrive_app/src/presentation/logic/new_password/new_pass_cubit.dart';
import 'package:carrive_app/src/presentation/logic/new_password/new_pass_state.dart';
import 'package:carrive_app/src/presentation/screens/login_screen.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_navigator.dart';
import '../../utils/components/auth_header.dart';
import '../../utils/constants/enums.dart';
import '../../utils/widgets/custom_back.dart';
import '../../utils/widgets/custom_buttons.dart';
import '../../utils/widgets/custom_textfield.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPasswordCubit(),
      child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
        listener: (context, state) {
          if (state is NewPasswordSuccess) {
            // Show a success message
            CustomToast.showUserTypeToast(
              type: ToastType.success,
              message: 'Password reset successfully',
            );
            // Redirect to the next page
            AppNavigator.pushReplacement(
              context,
              const LoginScreen(),
            );
          } else if (state is NewPasswordError) {
            // Show an error message
            CustomToast.showUserTypeToast(
              type: ToastType.error,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<NewPasswordCubit>();
          return CustomScreen(
            isLoading: state is NewPasswordLoading,
            loadingMessage: 'Resetting password',
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
                                title: 'Reset Password',
                                subtitle:
                                    'Please enter a new password then confirm the same so you can login afresh.',
                              ),
                              const Spacing(height: 20),
                              Form(
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      label: 'New Password',
                                      hint: '********',
                                      textEditingController:
                                          cubit.newPasswordController,
                                      obscureText: true,
                                      onChanged: cubit.onPasswordChanged,
                                      validationType:
                                          state is NewPasswordInvalid
                                              ? state.passwordValidationType
                                              : null,
                                    ),
                                    const Spacing(height: 12),
                                    CustomTextField(
                                      label: 'Confirm Password',
                                      hint: '********',
                                      textEditingController:
                                          cubit.confirmPasswordController,
                                      obscureText: true,
                                      onChanged: cubit.onConfirmPasswordChanged,
                                      validationType: state
                                              is NewPasswordInvalid
                                          ? state.confirmPasswordValidationType
                                          : null,
                                    ),
                                    const Spacing(height: 20),
                                    CustomButton(
                                      label: 'Reset Password',
                                      onTap: () {
                                        cubit.resetPassword();
                                      },
                                    ),
                                    const Spacing(height: 20),
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}
