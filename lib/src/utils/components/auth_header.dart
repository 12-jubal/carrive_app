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
          width: 64.w,
          height: 64.h,
        ),
        const Spacing(height: 22),
        Column(
          children: [
            Text(
              title,
              style: AppTextStyles.h4,
            ),
            const Spacing(height: 6),
            Text(
              subtitle,
              style: AppTextStyles.body3.copyWith(
                color: AppColors.black_700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
