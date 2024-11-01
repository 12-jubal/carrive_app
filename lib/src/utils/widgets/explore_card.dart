
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({
    super.key,
    required this.title,
    required this.imageLink,
    required this.onTap,
  });

  final String title;
  final String imageLink;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 12.w),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            shadows: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body3,
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow.svg',
                    height: 20.h,
                    width: 20.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              Image.asset(
                imageLink,
                height: 120.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
