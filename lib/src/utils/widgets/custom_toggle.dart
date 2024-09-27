import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomToggle extends StatelessWidget {
  const CustomToggle({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      padding: EdgeInsets.all(3.r),
      decoration: ShapeDecoration(
        color: AppColors.black_100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            isActive ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: ShapeDecoration(
              color: isActive ? AppColors.greenSource : AppColors.white,
              shape: const OvalBorder(),
              shadows: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: SvgPicture.asset(
              isActive
                  ? 'assets/icons/check_free.svg'
                  : 'assets/icons/close.svg',
              height: 15.h,
              width: 15.w,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.white : AppColors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
