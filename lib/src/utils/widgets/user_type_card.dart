import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserTypeCard extends StatelessWidget {
  const UserTypeCard({
    super.key,
    required this.isSelected,
    required this.label,
    required this.imageLink,
    required this.onTap,
  });

  final bool isSelected;
  final String label, imageLink;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 222.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary_100 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.primarySource : AppColors.black_500,
              width: isSelected ? 1 : 0.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: isSelected
                    ? SvgPicture.asset(
                        'assets/icons/checked_filled.svg',
                        width: 18.w,
                        height: 18.h,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primarySource,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/icons/uncheck_outlined.svg',
                        width: 18.w,
                        height: 18.h,
                        colorFilter: const ColorFilter.mode(
                          AppColors.black_500,
                          BlendMode.srcIn,
                        ),
                      ),
              ),
              Image.asset(imageLink, width: 85.w, height: 116.h),
              Text(
                label,
                style: AppTextStyles.body1.copyWith(
                  color: isSelected
                      ? AppColors.primarySource
                      : AppColors.black_500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
