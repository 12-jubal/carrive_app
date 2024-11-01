import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/presentation/screens/confirm_email_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/widgets/car_color_selector.dart';
import 'package:carrive_app/src/utils/widgets/custom_dropdown.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:carrive_app/src/presentation/logic/signup/signup_cubit.dart';
import 'package:carrive_app/src/presentation/logic/signup/signup_state.dart';
import 'package:carrive_app/src/utils/components/auth_header.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/widgets/custom_back.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';

class SignupCarScreen extends StatelessWidget {
  final UserType userType;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignupCarScreen({
    super.key,
    required this.userType,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) =>
          SignupCubit(userType: userType, localizations: locale),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupError) {
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
            AppNavigator.pushReplacement(
              context,
              ConfirmEmailScreen(user: state.user),
            );
          }
        },
        builder: (context, state) {
          Color? selectedColor = state.selectedColor;
          String? carModel = state.selectedModel;
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
                              const Spacing(height: 22),
                              Form(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Custom DropDown
                                    CustomDropdown(
                                      label: "Car Model",
                                      hint: "Select Car Model",
                                      options: const [
                                        "Toyota",
                                        "Honda",
                                        "BMW",
                                        "Ford"
                                      ],
                                      onChanged: cubit.onCarModelSelected,
                                      selectedValue: carModel,
                                    ),
                                    const Spacing(height: 14),
                                    CustomTextField(
                                      label: 'Car Matriculation',
                                      hint: 'ONT-123-456',
                                      onChanged: cubit.onCarMatriculationChange,
                                      textEditingController:
                                          cubit.carMatriculeController,
                                      validationType: null,
                                    ),
                                    const Spacing(height: 14),
                                    CustomTextField(
                                      label: 'Car ID Number',
                                      hint: '123456789',
                                      keyboardType: TextInputType.number,
                                      onChanged: cubit.onCarIdChange,
                                      textEditingController:
                                          cubit.carIdController,
                                      validationType: null,
                                    ),
                                    const Spacing(height: 14),
                                    // Select Colors
                                    CarColorSelector(
                                      onTap: cubit.onCarColorSelected,
                                      selectedColor: selectedColor,
                                    ),
                                    const Spacing(height: 22),
                                    if (userType == UserType.driver)
                                      CustomButton(
                                        onTap: () => cubit.driverSignup(
                                          name: name,
                                          email: email,
                                          password: password,
                                          confirmPassword: confirmPassword,
                                        ),
                                        label: 'Sign Up',
                                      )
                                    else
                                      const SizedBox(),

                                    const Spacing(height: 22),
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
