import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/profile/profile_cubit.dart';
import 'package:carrive_app/src/presentation/logic/profile/profile_state.dart';
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
import 'package:flutter_svg/svg.dart';

class PassengerProfileScreen extends StatelessWidget {
  final User user;
  const PassengerProfileScreen({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => ProfileCubit(
        user: user,
        locale: locale,
      ),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          final locale = AppLocalizations.of(context)!;
          return CustomScreen(
            isLoading: state is ProfileLoading,
            loadingMessage: state is ProfileLoading ? state.message : '',
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
                                    title: locale.appTheme,
                                    iconString: 'assets/icons/light_mode.svg',
                                    color: AppColors.blue_700,
                                    isOption: true,
                                    options: [
                                      locale.lightMode,
                                      locale.darkMode,
                                    ],
                                  ),
                                  Option(
                                    title: locale.language,
                                    iconString: 'assets/icons/language.svg',
                                    color: AppColors.secondarySource,
                                    isOption: true,
                                    options: [
                                      locale.english,
                                      locale.french,
                                    ],
                                    onChanged: cubit.selectLanguage,
                                  ),
                                ],
                              ),
                              const Spacing(height: 16),
                              // Profile Settings
                              BlocOption(
                                options: [
                                  Option(
                                    title: locale.favorites,
                                    iconString: 'assets/icons/favorite.svg',
                                    color: AppColors.redSource,
                                    onTap: () {},
                                  ),
                                  Option(
                                    title: locale.myTrips,
                                    iconString:
                                        'assets/icons/personal_places.svg',
                                    color: AppColors.yellowSource,
                                  ),
                                  Option(
                                    title: locale.billing,
                                    iconString: 'assets/icons/credit_card.svg',
                                    color: AppColors.greenSource,
                                  ),
                                  Option(
                                    onTap: () {},
                                    toggle: false,
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
                                      cubit.signOut();
                                    },
                                    iconString: 'assets/icons/logout.svg',
                                    title: locale.signOut,
                                    color: AppColors.red_900,
                                  ),
                                ],
                              ),
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
                        title: locale.profile,
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
      ),
    );
  }
}
