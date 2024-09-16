import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.bgcolor,
    this.textColor,
    required this.onTap,
    required this.label,
  });

  final Color? bgcolor, textColor;
  final Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          color: bgcolor ?? AppColors.primarySource,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTextStyles.body1.copyWith(
                color: textColor ?? AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}