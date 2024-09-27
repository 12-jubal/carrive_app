import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadingCard extends StatelessWidget {
  const LeadingCard({
    required this.bgColor,
    required this.question,
    required this.imageLink,
    required this.btnLabel,
    required this.btnColor,
    required this.onTap,
    super.key,
  });

  final String question, imageLink, btnLabel;
  final Color bgColor, btnColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question,
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.black_800,
                ),
              ),
              Spacing(height: 3.h),
              Text(
                'CARRIVE ?',
                style: AppTextStyles.bodyTitle.copyWith(
                  color: AppColors.black,
                ),
              ),
              Spacing(height: 3.h),
              Text(
                'Have an easy get start now',
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.black_800,
                ),
              ),
              Spacing(height: 12.h),
              CustomButton(
                bgcolor: btnColor,
                isMedium: true,
                onTap: onTap,
                label: btnLabel,
              ),
            ],
          ),
          Image.asset(
            imageLink,
            height: 140.h,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}
