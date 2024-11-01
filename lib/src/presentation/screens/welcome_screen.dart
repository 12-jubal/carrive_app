import 'dart:developer';

import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/presentation/screens/login_screen.dart';
import 'package:carrive_app/src/presentation/screens/signup_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/user_type_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../logic/welcome/welcome_cubit.dart';
import '../logic/welcome/welcome_state.dart';
import '../../utils/constants/enums.dart';
import '../../utils/style/colors.dart';
import '../../utils/widgets/custom_buttons.dart';
import '../../utils/widgets/custom_toast.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(),
      child: BlocConsumer<WelcomeCubit, WelcomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<WelcomeCubit>();
          final locale = AppLocalizations.of(context)!;
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/Logo_name.svg',
                    width: 85.w,
                    height: 85.h,
                  ),
                  const Spacing(height: 20),
                  Text(
                    locale.chooseHowToUseApp,
                    style: AppTextStyles.bodyTitle.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacing(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserTypeCard(
                        onTap: () {
                          cubit.selectUserType(UserType.driver);
                        },
                        isSelected:
                            context.watch<WelcomeCubit>().state.selectedType ==
                                UserType.driver,
                        imageLink: 'assets/images/driver.png',
                        label: locale.driver,
                      ),
                      const Spacing(width: 12),
                      UserTypeCard(
                        onTap: () {
                          cubit.selectUserType(UserType.passenger);
                        },
                        isSelected:
                            context.watch<WelcomeCubit>().state.selectedType ==
                                UserType.passenger,
                        imageLink: 'assets/images/passenger.png',
                        label: locale.passenger,
                      ),
                    ],
                  ),
                  const Spacing(height: 20),
                  CustomButton(
                    label: locale.continueText,
                    onTap: () {
                      if (cubit.state.selectedType == null) {
                        return CustomToast.showUserTypeToast(
                          type: ToastType.error,
                          message: locale.selectUserType,
                        );
                      } else {
                        AppNavigator.push(
                          context,
                          SignupScreen(
                            userType: cubit.state.selectedType!,
                          ),
                        );
                      }
                    },
                  ),
                  const Spacing(height: 20),
                  RichText(
                    text: TextSpan(
                      text: locale.alreadyHaveAnAccount,
                      style: AppTextStyles.caption1,
                      children: [
                        TextSpan(
                          text: locale.login,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.primarySource,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              log(context
                                  .read<WelcomeCubit>()
                                  .state
                                  .selectedType
                                  .toString());
                              AppNavigator.push(
                                context,
                                const LoginScreen(),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
