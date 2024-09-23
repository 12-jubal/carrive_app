import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pop(context);
      },
      child: SvgPicture.asset(
        'assets/icons/back.svg',
        height: 24.h,
        width: 24.w,
        colorFilter: const ColorFilter.mode(
          AppColors.black,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
