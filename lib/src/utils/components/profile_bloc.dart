import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBloc extends StatelessWidget {
  final String name, email;
  const ProfileBloc({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.4.h,
            color: AppColors.black_500,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                // padding: const EdgeInsets.only(
                //     top: 36, left: 36),
                decoration: ShapeDecoration(
                  //   image: DecorationImage(
                  //     image: NetworkImage(
                  //         "https://via.placeholder.com/50x50"),
                  //     fit: BoxFit.fill,
                  //   ),
                  color: AppColors.blue_200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    name[0],
                    style: AppTextStyles.h2.copyWith(
                      color: AppColors.blueSource,
                    ),
                  ),
                ),
              ),
              const Spacing(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.body1,
                  ),
                  const Spacing(
                    height: 2,
                  ),
                  Text(
                    email,
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.black_700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/forward.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.black_700,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
