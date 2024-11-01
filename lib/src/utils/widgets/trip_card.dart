import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.imageLink,
    required this.label,
  });
  final String imageLink;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      padding: EdgeInsets.all(12.r),
      decoration: ShapeDecoration(
        color: AppColors.primary_100,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.75,
            color: AppColors.primarySource,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageLink,
            height: 24.h,
            width: 24.w,
          ),
          Expanded(
            child: Text(label,
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.primarySource,
                ),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
