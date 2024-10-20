import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Statistic extends StatelessWidget {
  const Statistic({
    super.key,
    required this.whatStat,
    required this.statValue,
    required this.iconPath,
  });

  final String whatStat;
  final String statValue;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 16.h,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.3.h,
            color: AppColors.black_500,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                whatStat,
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.black_500,
                ),
              ),
              Text(
                statValue,
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.primarySource,
                ),
              ),
            ],
          ),
          SvgPicture.asset(iconPath, height: 40.h, width: 40.w),
        ],
      ),
    );
  }
}
