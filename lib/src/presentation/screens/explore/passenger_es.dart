import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/explore_logic/passenger_explore/pe_cubit.dart';
import 'package:carrive_app/src/presentation/logic/explore_logic/passenger_explore/pe_state.dart';
import 'package:carrive_app/src/presentation/screens/search_ride_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/explore_card.dart';
import 'package:carrive_app/src/utils/widgets/leading_card.dart';
import 'package:carrive_app/src/utils/widgets/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PassengerExploreScreen extends StatelessWidget {
  final User user;
  const PassengerExploreScreen({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengerExploreCubit(),
      child: BlocConsumer<PassengerExploreCubit, PassengerExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<PassengerExploreCubit>();
          final locale = AppLocalizations.of(context)!;
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 64.h,
                    left: 24.w,
                    right: 24.w,
                    bottom: 10.h,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20.h,
                        ),
                        child: Column(
                          children: [
                            LeadingCard(
                              bgColor: AppColors.secondary_200,
                              question: locale.areYouReady,
                              imageLink:
                                  'assets/images/woman_and_man_on_a_moped.png',
                              btnLabel: locale.searchRide,
                              btnColor: AppColors.primarySource,
                              onTap: () {
                                AppNavigator.push(context, const SearchRide());
                              },
                            ),
                            Spacing(height: 24.h),
                            // Explore
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  locale.explore,
                                  style: AppTextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacing(height: 8),
                                Row(
                                  children: [
                                    ExploreCard(
                                      title: locale.shipment,
                                      imageLink: 'assets/images/shipment.png',
                                      onTap: () {},
                                    ),
                                    Spacing(width: 24.w),
                                    ExploreCard(
                                      title: locale.rides,
                                      imageLink: 'assets/images/rides.png',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacing(height: 24.h),
                            // Trips
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      locale.myTrips,
                                      style: AppTextStyles.body1.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      'assets/icons/open_in_new.svg',
                                      height: 18.h,
                                      width: 18.w,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.black,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacing(height: 8),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      TripCard(
                                        imageLink: 'assets/icons/school.svg',
                                        label: locale.school,
                                      ),
                                      const Spacing(width: 24),
                                      TripCard(
                                        imageLink:
                                            'assets/icons/fitness_center.svg',
                                        label: locale.gym,
                                      ),
                                      const Spacing(width: 24),
                                      TripCard(
                                        imageLink: 'assets/icons/church.svg',
                                        label: locale.church,
                                      ),
                                      const Spacing(width: 24),
                                      TripCard(
                                        imageLink: 'assets/icons/office.svg',
                                        label: locale.work,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacing(height: 24.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Custom Appbar
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CustomExploreAppbar(
                      username: user.name,
                      hasNotification: true,
                      onTap: () {},
                    ),
                  ),
                  // const Center(
                  //   child: Text('Explore Screen'),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
