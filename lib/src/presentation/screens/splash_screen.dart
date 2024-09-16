import 'package:carrive_app/src/presentation/logic/splash/splash_cubit.dart';
import 'package:carrive_app/src/presentation/logic/splash/splash_state.dart';
import 'package:carrive_app/src/presentation/screens/welcome_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
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
            if (state is Loaded) {
              AppNavigator.pushReplacement(context, const WelcomeScreen());
            }
          },
          builder: (context, state) {
            if (state is Initial) {
              context.read<SplashCubit>().setRoot();
            } else if (state is Loading) {
              return Center(
                child: SvgPicture.asset(
                  "assets/icons/Logo_name.svg",
                  width: 120.w,
                  height: 120.h,
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
