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
    this.isMedium,
  });

  final Color? bgcolor, textColor;
  final Function() onTap;
  final String label;
  final bool? isMedium;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: (isMedium ?? false) ? 32.h : 46.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          color: bgcolor ?? AppColors.primarySource,
          borderRadius: BorderRadius.circular(8.r),
          border: bgcolor == Colors.transparent
              ? Border.all(color: textColor!)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: (isMedium ?? false)
                  ? AppTextStyles.caption1.copyWith(
                      color: textColor ?? AppColors.white,
                    )
                  : AppTextStyles.body1.copyWith(
                      color: textColor ?? AppColors.white,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
