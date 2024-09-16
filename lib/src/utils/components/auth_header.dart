import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../spacing.dart';
import '../style/colors.dart';
import '../style/text_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/Logo.svg',
          width: 50.w,
          height: 50.h,
        ),
        const Spacing(height: 20),
        Column(
          children: [
            Text(
              title,
              style: AppTextStyles.h5,
            ),
            const Spacing(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.body3.copyWith(
                color: AppColors.black_700,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
