// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carrive_app/src/presentation/screens/confirm_email_screen.dart';
import 'package:carrive_app/src/presentation/screens/signup_car_screen.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carrive_app/src/presentation/logic/signup/signup_cubit.dart';
import 'package:carrive_app/src/presentation/logic/signup/signup_state.dart';
import 'package:carrive_app/src/presentation/screens/login_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/auth_header.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_back.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  final UserType userType;
  const SignupScreen({
    super.key,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(userType),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is CarRegister) {
            AppNavigator.push(
              context,
              SignupCarScreen(
                userType: userType,
                name: state.name,
                email: state.email,
                password: state.password,
              ),
            );
          } else if (state is SignupError) {
            // Show error message
            CustomToast.showUserTypeToast(
              type: ToastType.error,
              message: state.message,
            );
          } else if (state is SignupSuccess) {
            CustomToast.showUserTypeToast(
              type: ToastType.success,
              message: "Confirm Registration",
            );
            // Navigate to the next screen
            AppNavigator.push(
              context,
              ConfirmEmailScreen(user: state.user),
            );
          } else if (state is SignupUnmatched) {
            CustomToast.showUserTypeToast(
              type: ToastType.error,
              message: "Passwords do not match",
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<SignupCubit>();
          return CustomScreen(
            isLoading: state is SignupLoading,
            loadingMessage: "Signing in User",
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
                              const Spacing(
                                height: 10,
                              ),
                              AuthHeader(
                                title: 'Welcome',
                                subtitle: userType == UserType.passenger
                                    ? 'Enjoy riding with CARRIVE . To enjoy our free services, please input your personal information.'
                                    : 'Enjoy creating rides with CARRIVE . To enjoy our services, please input the correct information.',
                              ),
                              const Spacing(height: 20),
                              Form(
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      label: 'Name',
                                      hint: 'John Doe',
                                      onChanged: cubit.onNameChanged,
                                      textEditingController:
                                          cubit.nameController,
                                      validationType: state is SignupInvalid
                                          ? state.nameValidationType
                                          : null,
                                    ),
                                    const Spacing(height: 12),
                                    CustomTextField(
                                      label: 'Email',
                                      hint: 'johndoe@gmail.com',
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: cubit.onEmailChanged,
                                      textEditingController:
                                          cubit.emailController,
                                      validationType: state is SignupInvalid
                                          ? state.emailValidationType
                                          : null,
                                    ),
                                    const Spacing(height: 12),
                                    CustomTextField(
                                      label: 'Password',
                                      hint: '********',
                                      obscureText: true,
                                      onChanged: cubit.onPasswordChanged,
                                      textEditingController:
                                          cubit.passwordController,
                                      validationType: state is SignupInvalid
                                          ? state.passwordValidationType
                                          : null,
                                    ),
                                    const Spacing(height: 12),
                                    CustomTextField(
                                      label: 'Confirm Password',
                                      hint: '********',
                                      obscureText: true,
                                      onChanged: cubit.onConfirmPasswordChanged,
                                      textEditingController:
                                          cubit.confirmPasswordController,
                                      validationType: state is SignupInvalid
                                          ? state.confirmPasswordValidationType
                                          : null,
                                    ),
                                    const Spacing(height: 20),
                                    if (userType == UserType.passenger)
                                      CustomButton(
                                        onTap: () {
                                          cubit.signup(userType: userType);
                                        },
                                        label: 'Sign Up',
                                      )
                                    else
                                      CustomButton(
                                        onTap: () {
                                          cubit.onContinue();
                                        },
                                        label: 'Continue',
                                      ),
                                    const Spacing(height: 10),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Already have an account? ',
                                        style: AppTextStyles.caption1,
                                        children: [
                                          TextSpan(
                                            text: 'Login',
                                            style:
                                                AppTextStyles.caption1.copyWith(
                                              color: AppColors.primarySource,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                AppNavigator.push(
                                                  context,
                                                  const LoginScreen(),
                                                );
                                              },
                                          ),
                                        ],
                                      ),
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
