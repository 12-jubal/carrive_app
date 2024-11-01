import 'dart:developer';
import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/create_ride/create_ride_cubit.dart';
import 'package:carrive_app/src/presentation/logic/create_ride/create_ride_state.dart';
import 'package:carrive_app/src/presentation/root/root_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/bloc_options.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/components/option.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/custom_bottom_sheet.dart';
import 'package:carrive_app/src/utils/widgets/custom_toast.dart';
import 'package:carrive_app/src/utils/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRide extends StatefulWidget {
  final User user;
  const CreateRide({
    super.key,
    required this.user,
  });

  @override
  State<CreateRide> createState() => _CreateRideState();
}

class _CreateRideState extends State<CreateRide> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => CreateRideCubit(localizations: locale),
      child: BlocConsumer<CreateRideCubit, CreateRideState>(
        listener: (context, state) {
          if (state is CreateRideError) {
            // Show error message
            CustomToast.showUserTypeToast(
              type: ToastType.error,
              message: state.message,
            );
          }
          if (state is ConfirmRideCreation) {
            // CustomButtonBottom.showOptions(
            //   context,
            //   primaryText: AppLocalizations.of(context)!.post,
            //   secondaryText: AppLocalizations.of(context)!.saveInDraft,
            //   primaryonTap: () => context.read<CreateRideCubit>().createRide(),
            //   secondaryonTap: context.read<CreateRideCubit>().saveRide,
            // );
          }
          if (state is CreateRideSuccess) {
            AppNavigator.push(context, RootScreen(user: widget.user));
          }
        },
        builder: (BuildContext context, state) {
          final cubit = context.read<CreateRideCubit>();
          final locale = AppLocalizations.of(context)!;
          String pickUp = state.pickupLocation?.mainText ?? locale.choosePickup;
          String destination =
              state.destinationLocation?.mainText ?? locale.chooseDestination;
          String price = state.price.toStringAsFixed(2);
          String car =
              state.vehicle != null ? state.vehicle! : locale.selectCar;
          String date = state.departureDate?.toString().split(' ')[0] ??
              DateTime.now().toString().split(' ')[0];
          String time =
              state.departureTime?.toString().split(' ')[1].split('.')[0] ??
                  DateTime.now().toString().split(' ')[1].split('.')[0];
          String acceptLuggage = locale.no;
          String capacity = state.numberOfPlaces.toString();
          if (state.allowExpedition == true) {
            acceptLuggage = locale.yes;
          } else {
            acceptLuggage = locale.no;
          }

          return CustomScreen(
            isLoading: state is CreateRideLoading,
            loadingMessage: state is CreateRideLoading ? state.message : '',
            child: Scaffold(
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
                                        title: locale.choosePickup,
                                        searchHintText: 'Search for pickup',
                                        onTextChanged: cubit.onPickupSelected,
                                      );
                                    },
                                    iconString:
                                        'assets/icons/location_filled.svg',
                                    title: locale.pickUp,
                                    value: pickUp,
                                    color: AppColors.red_900,
                                  ),
                                  Option(
                                    onTap: () {
                                      CustomLocationBottomSheet.showplaces(
                                        context,
                                        title: locale.chooseDestination,
                                        searchHintText:
                                            'Search for destination',
                                        onTextChanged:
                                            cubit.onDestinationSelected,
                                      );
                                    },
                                    iconString: 'assets/icons/flag_filled.svg',
                                    title: locale.destination,
                                    value: destination,
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
                                      // log('Fix a price');
                                      cubit.placeDetails();
                                    },
                                    iconString: 'assets/icons/money_filled.svg',
                                    title: locale.price,
                                    value:
                                        '${locale.calculatedPrice} : \$$price',
                                    color: AppColors.greenSource,
                                  ),
                                  Option(
                                    onTap: () {
                                      log('Billing Info');
                                    },
                                    iconString: 'assets/icons/credit_card.svg',
                                    title: locale.billing,
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
                                      CustomDateTimePicker.showDatePicker(
                                        context,
                                        title: locale.selectDate,
                                        onSubmit: (date) =>
                                            cubit.onDepartureDateSelected(date),
                                      );
                                    },
                                    iconString:
                                        'assets/icons/calender_filled.svg',
                                    title: locale.date,
                                    value: date,
                                    color: AppColors.secondary_900,
                                  ),
                                  Option(
                                    onTap: () {
                                      // log('Kickoff Time');
                                      CustomDateTimePicker.showTimePicker(
                                        context,
                                        title: locale.selectTime,
                                        onSubmit: (time) =>
                                            cubit.onDepartureTimeSelected(time),
                                      );
                                    },
                                    iconString:
                                        'assets/icons/nest_clock_farsight_analog.svg',
                                    title: locale.time,
                                    value: time,
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
                                      CustomOptionBottomSheet
                                          .showOptionsBottomSheet(
                                        context,
                                        title: locale.selectCar,
                                        // options: ['SUV-8', 'BMW'],
                                        options: widget.user.cars
                                            .map((car) => car.carModel)
                                            .toList(),
                                        onChanged: cubit.onCarSelect,
                                        selectedValue: car,
                                      );
                                    },
                                    iconString:
                                        'assets/icons/directions_car_full.svg',
                                    title: locale.vehicle,
                                    value: car,
                                    color: AppColors.primary_900,
                                  ),
                                  Option(
                                    onTap: () {
                                      // log('Vehicle Capacity');
                                    },
                                    iconString: 'assets/icons/person.svg',
                                    title: locale.numberOfPlaces,
                                    value: capacity,
                                    color: AppColors.orangeSource,
                                    isNumber: true,
                                    increment: cubit.increment,
                                    decrement: cubit.decrement,
                                  ),
                                  Option(
                                    onTap: cubit.onPermissionClick,
                                    iconString:
                                        'assets/icons/checked_bag_filled.svg',
                                    title: locale.permitShipping,
                                    value: acceptLuggage,
                                    color: AppColors.black_700,
                                    toggle: state.allowExpedition,
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
                        leading: Text(locale.cancel),
                        title: locale.newRide,
                        shadow: true,
                        trailing: GestureDetector(
                          onTap: () {
                            cubit.createRide(
                              date: date,
                              time: time,
                              price: double.parse(price),
                              pickUp: pickUp,
                              destination: destination,
                              allowBaggage: state.allowExpedition,
                              capacity: int.parse(capacity),
                              distance: state.distance,
                            );
                          },
                          child: Text(
                            locale.ok,
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.skyBlueSource,
                            ),
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
