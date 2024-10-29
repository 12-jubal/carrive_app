import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RequestBooking extends StatelessWidget {
  const RequestBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.black_300,
          width: 0.5.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            offset: const Offset(0.0, 20.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking Id: 2233482910',
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.primarySource,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text('Booking for: 08:30', style: AppTextStyles.caption1),
            ],
          ),
          Spacing(height: 10.h),
          Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location_filled.svg',
                    height: 24.h,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.redSource,
                      BlendMode.srcIn,
                    ),
                  ),
                  Spacing(width: 4.w),
                  Text(
                    'Departure:',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.black_600,
                    ),
                  ),
                  Spacing(width: 8.w),
                  Text(
                    'Vancouver',
                    style: AppTextStyles.caption1,
                  ),
                ],
              ),
              Spacing(height: 2.h),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/flag_2.svg',
                    height: 24.h,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.greenSource,
                      BlendMode.srcIn,
                    ),
                  ),
                  Spacing(width: 4.w),
                  Text(
                    'Arrival:',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.black_600,
                    ),
                  ),
                  Spacing(width: 8.w),
                  Text(
                    'Toronto',
                    style: AppTextStyles.caption1,
                  ),
                ],
              ),
            ],
          ),
          Spacing(height: 10.h),
          Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: const ShapeDecoration(
                  color: AppColors.blue_200,
                  shape: CircleBorder(),
                ),
                child: Center(
                  child: Text(
                    'U',
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.blueSource,
                    ),
                  ),
                ),
              ),
              const Spacing(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Engelson',
                    style: AppTextStyles.body2,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/person.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Spacing(width: 2),
                      Text(
                        '2 place(s)',
                        style: AppTextStyles.caption2,
                      ),
                      const Spacing(width: 10),
                      SvgPicture.asset(
                        'assets/icons/carry_on_bag.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.secondarySource,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Spacing(width: 2),
                      Text(
                        '2kg breakable',
                        style: AppTextStyles.caption2,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/cancel_filled.svg',
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.redSource,
                      BlendMode.srcIn,
                    ),
                  ),
                  const Spacing(width: 12),
                  SvgPicture.asset(
                    'assets/icons/checked_filled.svg',
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.greenSource,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
