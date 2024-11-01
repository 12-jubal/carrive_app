import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/presentation/logic/search_ride/search_ride_cubit.dart';
import 'package:carrive_app/src/presentation/logic/search_ride/search_ride_state.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:carrive_app/src/utils/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchRide extends StatelessWidget {
  const SearchRide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchRideCubit(),
      child: BlocConsumer<SearchRideCubit, SearchRideState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<SearchRideCubit>();
          final locale = AppLocalizations.of(context)!;
          final time =
              state.departureTime?.toString().split(' ')[1].split('.')[0] ??
                  locale.selectTime;
          String date = state.departureDate?.toString().split(' ')[0] ??
              locale.selectDate;
          return CustomScreen(
            isLoading: state is SearchRideLoading,
            loadingMessage: state is SearchRideLoading ? state.message : '',
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
                              Container(
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.r,
                                      color: AppColors.primarySource,
                                    ),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SearchComponent(
                                      onTap: () {
                                        CustomDateTimePicker.showTimePicker(
                                          context,
                                          title: locale.selectTime,
                                          onSubmit: (time) => cubit
                                              .onDepartureTimeSelected(time),
                                        );
                                      },
                                      iconPath:
                                          'assets/icons/outlined_nest_clock_farsight_analog.svg',
                                      value: time,
                                    ),
                                    SearchComponent(
                                      onTap: () {
                                        CustomDateTimePicker.showDatePicker(
                                            context,
                                            title: locale.selectDate,
                                            onSubmit: (date) => cubit
                                                .onDepartureDateSelected(date));
                                      },
                                      iconPath:
                                          'assets/icons/calendar_month.svg',
                                      value: date,
                                    ),
                                    SearchComponent(
                                      onTap: () {},
                                      iconPath: 'assets/icons/location_on.svg',
                                      value: 'Select Pickup',
                                    ),
                                    SearchComponent(
                                      onTap: () {},
                                      iconPath:
                                          'assets/icons/outlined_flag_2.svg',
                                      value: 'Select Destination',
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.h),
                                      decoration: const BoxDecoration(
                                        color: AppColors.primarySource,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            locale.searchRide,
                                            style: AppTextStyles.body2.copyWith(
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
                        title: locale.searchRide,
                        shadow: true,
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
