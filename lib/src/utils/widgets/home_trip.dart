import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTrip extends StatelessWidget {
  const HomeTrip({
    super.key,
    required this.imageLink,
    required this.start,
    required this.end,
    required this.time,
    required this.price,
  });

  final String imageLink;
  final String start, end;
  final String time, price;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.3.h,
            color: AppColors.black_500,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 162.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  imageLink,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$start to $end',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.black_700,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacing(height: 4),
                  Row(
                    children: [
                      Text(time, style: AppTextStyles.body3),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          text: '\$$price',
                          style: AppTextStyles.body2.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: '/${locale.seats}',
                              style: AppTextStyles.caption2.copyWith(
                                color: AppColors.black_500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
