import 'package:carrive_app/src/presentation/logic/login/login_cubit.dart';
import 'package:carrive_app/src/presentation/logic/login/login_state.dart';
import 'package:carrive_app/src/presentation/root/root_screen.dart';
import 'package:carrive_app/src/presentation/screens/forgot_pass_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/auth_header.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/widgets/custom_back.dart';
import '../../utils/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // Navigate to the next screen
            AppNavigator.pushReplacement(
                context,
                RootScreen(
                  user: state.user,
                ));
          } else if (state is LoginError) {
            // Show error message
            CustomToast.showUserTypeToast(
              type: ToastType.error,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return CustomScreen(
            isLoading: state is LoginLoading,
            loadingMessage: "User is logging in",
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
                                title: "Welcome Back",
                                subtitle:
                                    "To continue riding with CARRIVE  and connecting, please input your personal information",
                              ),
                              const Spacing(height: 24),
                              Form(
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      label: 'Email',
                                      hint: 'johndoe@gmail.com',
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: cubit.onEmailChanged,
                                      textEditingController:
                                          cubit.emailController,
                                      validationType: state is LoginInvalid
                                          ? state.emailValidationType
                                          : null,
                                    ),
                                    const Spacing(height: 14),
                                    CustomTextField(
                                      label: 'Password',
                                      hint: '********',
                                      obscureText: true,
                                      onChanged: cubit.onPasswordChanged,
                                      textEditingController:
                                          cubit.passwordController,
                                      validationType: state is LoginInvalid
                                          ? state.passwordValidationType
                                          : null,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacing(height: 22),
                              Align(
                                alignment: Alignment.topRight,
                                child: RichText(
                                  text: TextSpan(
                                    text: "Forgot Password?",
                                    style: AppTextStyles.caption1.copyWith(
                                      color: AppColors.primarySource,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigate to the forgot password screen
                                        AppNavigator.push(
                                          context,
                                          const ForgotPasswordScreen(),
                                        );
                                      },
                                  ),
                                ),
                              ),
                              const Spacing(height: 14),
                              CustomButton(
                                onTap: () {
                                  cubit.login(context: context);
                                },
                                label: 'Login',
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
      ),
    );
  }
}
