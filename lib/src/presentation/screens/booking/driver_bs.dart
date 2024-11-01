import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/logic/booking/booking_cubit.dart';
import 'package:carrive_app/src/presentation/logic/booking/booking_state.dart';
import 'package:carrive_app/src/utils/components/custom_screen.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/request_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DriverBookingScreen extends StatefulWidget {
  final User user;
  const DriverBookingScreen({
    super.key,
    required this.user,
  });

  @override
  State<DriverBookingScreen> createState() => _DriverBookingScreenState();
}

class _DriverBookingScreenState extends State<DriverBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final locale = AppLocalizations.of(context)!;
          final cubit = context.read<BookingCubit>();

          return CustomScreen(
            isLoading: state is BookingLoading,
            loadingMessage: state is BookingLoading ? state.message : '',
            child: Scaffold(
              body: SafeArea(
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
                                    height: 0.23.sh,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.black_300,
                                        width: 0.5.w,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.05),
                                          offset: const Offset(0.0, 20.0),
                                          blurRadius: 20.0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12.r),
                                          child: Row(
                                            children: [
                                              Text(
                                                  cubit.headerText
                                                      .split(' ')[0],
                                                  style: AppTextStyles.body2),
                                              const Spacing(width: 4),
                                              Text(
                                                cubit.headerText.split(' ')[1],
                                                style: AppTextStyles.body1
                                                    .copyWith(
                                                  fontWeight: FontWeight.w800,
                                                  color:
                                                      AppColors.primarySource,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 12.w,
                                              right: 12.w,
                                              bottom: 12.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/back.svg',
                                                height: 20.h,
                                                width: 20,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  AppColors.black,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              Text(
                                                '${locale.week} ${cubit.weekNumber}',
                                                style: AppTextStyles.body2,
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/forward.svg',
                                                height: 20.h,
                                                width: 20,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  AppColors.black,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 12.w,
                                              right: 12.w,
                                              bottom: 12.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                locale.monday.substring(0, 3),
                                                style: AppTextStyles.body2
                                                    .copyWith(
                                                  color: AppColors.black_600,
                                                ),
                                              ),
                                              Text(
                                                locale.tuesday.substring(0, 3),
                                                style: AppTextStyles.body2
                                                    .copyWith(
                                                  color: AppColors.black_600,
                                                ),
                                              ),
                                              Text(
                                                locale.wednesday
                                                    .substring(0, 3),
                                                style: AppTextStyles.body2
                                                    .copyWith(
                                                  color: AppColors.black_600,
                                                ),
                                              ),
                                              Text(
                                                locale.thursday.substring(0, 3),
                                                style: AppTextStyles.body2
                                                    .copyWith(
                                                  color: AppColors.black_600,
                                                ),
                                              ),
                                              Text(
                                                locale.friday.substring(0, 3),
                                                style: AppTextStyles.body2
                                                    .copyWith(
                                                  color: AppColors.black_600,
                                                ),
                                              ),
                                              Text(
                                                locale.saturday.substring(0, 3),
                                                style: AppTextStyles.body2
                                                    .copyWith(
                                                  color: AppColors.black_600,
                                                ),
                                              ),
                                              Text(
                                                locale.sunday.substring(0, 3),
                                                style: AppTextStyles.body2
                                                    .copyWith(
                                                  color: AppColors.black_600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          child: SfCalendar(
                                            headerHeight: 0,
                                            viewHeaderHeight: 0,
                                            firstDayOfWeek: 1,
                                            controller:
                                                cubit.calendarController,
                                            cellBorderColor: Colors.transparent,
                                            view: CalendarView.month,
                                            monthCellBuilder:
                                                (BuildContext context,
                                                    MonthCellDetails details) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: details.date.weekday ==
                                                          DateTime.now().weekday
                                                      ? AppColors
                                                          .secondarySource
                                                      : AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    details.date.day.toString(),
                                                    style: AppTextStyles
                                                        .caption1
                                                        .copyWith(
                                                      color: details.date
                                                                  .weekday ==
                                                              DateTime.now()
                                                                  .weekday
                                                          ? AppColors.white
                                                          : AppColors
                                                              .secondarySource,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            monthViewSettings:
                                                MonthViewSettings(
                                              showAgenda: true,
                                              numberOfWeeksInView: 1,
                                              agendaViewHeight: 0.3.sh,
                                            ),
                                            onViewChanged: (ViewChangedDetails
                                                viewChangedDetails) {
                                              cubit.headerText =
                                                  DateFormat('MMMM yyyy')
                                                      .format(viewChangedDetails
                                                              .visibleDates[
                                                          viewChangedDetails
                                                                  .visibleDates
                                                                  .length ~/
                                                              2])
                                                      .toString();
                                              cubit.weekNumber = cubit
                                                  .weekOfYear(viewChangedDetails
                                                          .visibleDates[
                                                      viewChangedDetails
                                                              .visibleDates
                                                              .length ~/
                                                          2])
                                                  .toString();
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback(
                                                      (duration) {
                                                setState(() {});
                                              });
                                            },
                                            // firstDayOfWeek: 1,
                                            // view: CalendarView.month,
                                            // cellBorderColor: Colors.transparent,
                                            // headerStyle: CalendarHeaderStyle(
                                            //   backgroundColor: Colors.transparent,
                                            //   textStyle: AppTextStyles.body2.copyWith(
                                            //     color: AppColors.primarySource,
                                            //   ),
                                            // ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacing(height: 16),
                                  const RequestBooking(),
                                  const Spacing(height: 16),
                                  const RequestBooking(),
                                  const Spacing(height: 16),
                                  const RequestBooking()
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Bookings Appbar
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: CustomProfileAppbar(
                            title: locale.bookings,
                            shadow: false,
                            trailing: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/check.svg',
                                    height: 24.h,
                                    width: 24.w,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                const Spacing(width: 12),
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/sort.svg',
                                    height: 24.h,
                                    width: 24.w,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                const Spacing(width: 12),
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/tune.svg',
                                    height: 24.h,
                                    width: 24.w,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
