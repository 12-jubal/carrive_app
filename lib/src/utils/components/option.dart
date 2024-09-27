import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.onTap,
    required this.iconString,
    required this.title,
    required this.value,
    required this.color,
    this.toggle,
  });

  final Function() onTap;
  final String iconString, title, value;
  final Color color;
  final bool? toggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 4.h,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: SvgPicture.asset(
                    iconString,
                    height: 24.h,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const Spacing(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.black_900,
                      ),
                    ),
                    Text(
                      value,
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.skyBlueSource,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (toggle != null)
              CustomToggle(
                isActive: toggle ?? false,
              )
            else
              SvgPicture.asset(
                'assets/icons/forward.svg',
                colorFilter: const ColorFilter.mode(
                  AppColors.black_700,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
