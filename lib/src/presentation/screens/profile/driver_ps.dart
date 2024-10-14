import 'dart:developer';

import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/profile/profile_cubit.dart';
import 'package:carrive_app/src/presentation/logic/profile/profile_state.dart';
import 'package:carrive_app/src/presentation/screens/my_docs.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/bloc_options.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/components/option.dart';
import 'package:carrive_app/src/utils/components/profile_bloc.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverProfileScreen extends StatelessWidget {
  final User user;
  const DriverProfileScreen({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit(user: user),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSignOut) {
              log('Sign Out');
            }
          },
          builder: (context, state) {
            // final cubit = context.read<ProfileCubit>();
            final locale = AppLocalizations.of(context)!;
            return CustomScreen(
              isLoading: state is ProfileLoading,
              loadingMessage: locale.loadingProfile,
              child: Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 72.h,
                        left: 24.w,
                        right: 24.w,
                        bottom: 10.h,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Column(
                              children: [
                                ProfileBloc(name: user.name, email: user.email),
                                const Spacing(height: 24),
                                // Starter Settings for app usage
                                BlocOption(
                                  options: [
                                    Option(
                                      onTap: () {},
                                      iconString: 'assets/icons/light_mode.svg',
                                      title: locale.appTheme,
                                      color: AppColors.blue_700,
                                    ),
                                    Option(
                                      onTap: () {},
                                      iconString: 'assets/icons/language.svg',
                                      title: locale.language,
                                      color: AppColors.secondarySource,
                                    ),
                                  ],
                                ),
                                const Spacing(height: 16),
                                // My Work Settings
                                BlocOption(
                                  options: [
                                    Option(
                                      onTap: () {},
                                      iconString:
                                          'assets/icons/directions_car.svg',
                                      title: locale.myCars,
                                      color: AppColors.red_700,
                                    ),
                                    Option(
                                      onTap: () {
                                        AppNavigator.push(
                                            context, MyDocuments(user: user));
                                      },
                                      iconString:
                                          'assets/icons/home_storage.svg',
                                      title: 'My Documents',
                                      color: AppColors.blueSource,
                                    ),
                                    Option(
                                      onTap: () {},
                                      iconString:
                                          'assets/icons/credit_card.svg',
                                      title: locale.bankInformation,
                                      color: AppColors.greenSource,
                                    ),
                                    Option(
                                      onTap: () {},
                                      iconString:
                                          'assets/icons/notifications_active.svg',
                                      title: locale.notifications,
                                      color: AppColors.skyBlue_800,
                                    ),
                                  ],
                                ),
                                const Spacing(height: 16),
                                BlocOption(
                                  options: [
                                    Option(
                                      onTap: () {
                                        log('Sign Out');
                                      },
                                      iconString: 'assets/icons/logout.svg',
                                      title: locale.signOut,
                                      color: AppColors.red_900,
                                    ),
                                  ],
                                ),

                                const Spacing(height: 16),
                                const Text('Profile Screeeeeen'),
                                Text(user.name),
                                Text(user.email),
                                Text('${user.userType}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Placing the Profile App Bar
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: CustomProfileAppbar(
                          title: AppLocalizations.of(context)!.profile,
                          shadow: false,
                          trailing: SvgPicture.asset(
                            'assets/icons/search.svg',
                            height: 24.h,
                            width: 24.w,
                            colorFilter: const ColorFilter.mode(
                              AppColors.black,
                              BlendMode.srcIn,
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
