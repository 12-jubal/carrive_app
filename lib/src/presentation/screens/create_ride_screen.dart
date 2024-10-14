import 'dart:developer';
import 'package:carrive_app/src/presentation/logic/create_ride/create_ride_cubit.dart';
import 'package:carrive_app/src/presentation/logic/create_ride/create_ride_state.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/bloc_options.dart';
import 'package:carrive_app/src/utils/components/option.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/custom_bottom_sheet.dart';
import 'package:carrive_app/src/utils/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRide extends StatefulWidget {
  const CreateRide({super.key});

  @override
  State<CreateRide> createState() => _CreateRideState();
}

class _CreateRideState extends State<CreateRide> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRideCubit(),
      child: BlocConsumer<CreateRideCubit, CreateRideState>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          // final cubit = context.read<CreateRideCubit>();

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 56.h,
                    left: 24.w,
                    right: 24.w,
                    bottom: 10.h,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Column(
                          children: [
                            // Locations
                            BlocOption(
                              options: [
                                Option(
                                  onTap: () {
                                    CustomLocationBottomSheet.showplaces(
                                      context,
                                      title: 'Pickup Location',
                                      searchHintText: 'Search for pickup',
                                    );
                                  },
                                  iconString:
                                      'assets/icons/location_filled.svg',
                                  title: 'Pick up',
                                  value: 'Location',
                                  color: AppColors.red_900,
                                ),
                                Option(
                                  onTap: () {
                                    CustomLocationBottomSheet.showplaces(
                                      context,
                                      title: 'Destination Location',
                                      searchHintText: 'Search for destination',
                                    );
                                  },
                                  iconString: 'assets/icons/flag_filled.svg',
                                  title: 'Destination',
                                  value: 'Location',
                                  color: AppColors.yellowSource,
                                ),
                              ],
                            ),
                            const Spacing(height: 24),
                            // Pricing
                            BlocOption(
                              options: [
                                Option(
                                  onTap: () {
                                    log('Fix a price');
                                  },
                                  iconString: 'assets/icons/money_filled.svg',
                                  title: 'Price',
                                  value: 'Calculated price : \$0.00',
                                  color: AppColors.greenSource,
                                ),
                                Option(
                                  onTap: () {
                                    log('Billing Info');
                                  },
                                  iconString: 'assets/icons/credit_card.svg',
                                  title: 'Billing',
                                  value: 'Credit card : *******23456',
                                  color: AppColors.skyBlueSource,
                                ),
                              ],
                            ),
                            const Spacing(height: 24),
                            // Timing Info
                            BlocOption(
                              options: [
                                Option(
                                  onTap: () {
                                    log('Kickoff Date');
                                    // CustomDatePicker.selectDate(
                                    //   context,
                                    //   title: 'Select Date',
                                    // );
                                    CustomDatePicker.showDatePicker(
                                      context,
                                      title: 'Select Date',
                                    );
                                  },
                                  iconString:
                                      'assets/icons/calender_filled.svg',
                                  title: 'Date',
                                  value: '2024-08-30',
                                  color: AppColors.secondary_900,
                                ),
                                Option(
                                  onTap: () {
                                    log('Kickoff Time');
                                  },
                                  iconString:
                                      'assets/icons/nest_clock_farsight_analog.svg',
                                  title: 'Time',
                                  value: '00:00',
                                  color: AppColors.blueSource,
                                ),
                              ],
                            ),
                            const Spacing(height: 24),
                            // Vehicle Info
                            BlocOption(
                              options: [
                                Option(
                                  onTap: () {
                                    log('Vehicle Type');
                                  },
                                  iconString:
                                      'assets/icons/directions_car_full.svg',
                                  title: 'Vehicle',
                                  value: 'SUV-8',
                                  color: AppColors.primary_900,
                                ),
                                Option(
                                  onTap: () {
                                    log('Vehicle Capacity');
                                  },
                                  iconString: 'assets/icons/person.svg',
                                  title: 'Number of Places',
                                  value: '5',
                                  color: AppColors.orangeSource,
                                ),
                                Option(
                                  onTap: () {
                                    log('Vehicle Capacity');
                                  },
                                  iconString:
                                      'assets/icons/checked_bag_filled.svg',
                                  title: 'Permit Shipping',
                                  value: 'No',
                                  color: AppColors.black_700,
                                  toggle: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CustomAppbar(
                      onLeadingTap: () {
                        AppNavigator.pop(context);
                      },
                      leading: const Text('Cancel'),
                      title: "New Ride",
                      shadow: true,
                      trailing: const Text('Ok'),
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
