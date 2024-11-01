import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/explore_logic/driver_explore/de_cubit.dart';
import 'package:carrive_app/src/presentation/logic/explore_logic/driver_explore/de_state.dart';
import 'package:carrive_app/src/presentation/screens/create_ride_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/home_trip.dart';
import 'package:carrive_app/src/utils/widgets/leading_card.dart';
import 'package:carrive_app/src/utils/widgets/stat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DriverExploreScreen extends StatelessWidget {
  final User user;
  const DriverExploreScreen({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriverExploreCubit(),
      child: BlocConsumer<DriverExploreCubit, DriverExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<DriverExploreCubit>();
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
                              bgColor: AppColors.primary_200,
                              question: locale.doYouWantTo,
                              imageLink: 'assets/images/delivery_guy.png',
                              btnLabel: locale.createRide,
                              btnColor: AppColors.secondarySource,
                              onTap: () {
                                AppNavigator.push(
                                    context,
                                    CreateRide(
                                      user: user,
                                    ));
                              },
                            ),
                            const Spacing(height: 24),
                            // Driver Stats
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  locale.myStats,
                                  style: AppTextStyles.body1.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacing(height: 8),
                                GridView.count(
                                  primary: false,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.h,
                                  mainAxisSpacing: 8.h,
                                  shrinkWrap: true,
                                  childAspectRatio: 1.8.h,
                                  children: [
                                    Statistic(
                                      whatStat: locale.myCars,
                                      statValue: '0',
                                      iconPath:
                                          'assets/images/directions_car.svg',
                                    ),
                                    Statistic(
                                      whatStat: locale.rides,
                                      statValue: '0',
                                      iconPath:
                                          'assets/images/local_shipping.svg',
                                    ),
                                    Statistic(
                                      whatStat: locale.ratings,
                                      statValue: '0',
                                      iconPath: 'assets/images/star.svg',
                                    ),
                                    Statistic(
                                      whatStat: locale.revenue,
                                      statValue: '0',
                                      iconPath: 'assets/images/payments.svg',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Driver's End Stats
                            const Spacing(height: 24),

                            // Recent Rides
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      locale.recentTrips,
                                      style: AppTextStyles.body1.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      'assets/icons/open_in_new.svg',
                                      height: 18.h,
                                      width: 18.w,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.primarySource,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacing(height: 8),
                                GridView.count(
                                  primary: false,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.h,
                                  mainAxisSpacing: 8.h,
                                  shrinkWrap: true,
                                  childAspectRatio: 0.73.h,
                                  children: const [
                                    HomeTrip(
                                      imageLink:
                                          "https://plus.unsplash.com/premium_photo-1721654789105-43ff4bb0a486?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8UGxhY2VzfGVufDB8fDB8fHww",
                                      start: "Vancouver",
                                      end: "Toronto",
                                      time: "08:00",
                                      price: "70",
                                    ),
                                    HomeTrip(
                                      imageLink:
                                          "https://images.unsplash.com/photo-1524473994769-c1bbbf30e944?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8UGxhY2VzfGVufDB8fDB8fHww",
                                      start: "Vancouver",
                                      end: "Toronto",
                                      time: "08:00",
                                      price: "70",
                                    ),
                                    HomeTrip(
                                      imageLink:
                                          "https://images.unsplash.com/photo-1705346435684-a9de6cbb53dc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8UGxhY2VzfGVufDB8fDB8fHww",
                                      start: "Vancouver",
                                      end: "Toronto",
                                      time: "08:00",
                                      price: "70",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Appbar
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
