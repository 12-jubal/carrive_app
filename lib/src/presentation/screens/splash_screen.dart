import 'package:carrive_app/src/presentation/logic/splash/splash_cubit.dart';
import 'package:carrive_app/src/presentation/logic/splash/splash_state.dart';
import 'package:carrive_app/src/presentation/root/root_screen.dart';
import 'package:carrive_app/src/presentation/screens/welcome_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is WelcomeLoaded) {
              AppNavigator.pushReplacement(context, const WelcomeScreen());
            } else if (state is HomeLoaded) {
              AppNavigator.pushReplacement(
                  context, RootScreen(user: state.user));
            }
          },
          builder: (context, state) {
            final cubit = context.read<SplashCubit>();
            if (state is Initial) {
              cubit.setRoot();
            } else if (state is Loading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Logo_name.svg",
                      width: 120.w,
                      height: 120.h,
                    ),
                    const Spacing(height: 30),
                    SizedBox(
                      width: 0.5.sw,
                      child: const LinearProgressIndicator(
                        color: AppColors.primarySource,
                        backgroundColor: AppColors.primary_200,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: SvgPicture.asset(
                  "assets/icons/Logo_name.svg",
                  width: 120.w,
                  height: 120.h,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
