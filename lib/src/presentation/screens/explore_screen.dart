import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatelessWidget {
  final User user;
  const ExploreScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 64.h,
              left: 24.w,
              right: 24.w,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 150.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.secondary_200,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Are you ready for a',
                                  style: AppTextStyles.caption1.copyWith(
                                    color: AppColors.black_800,
                                  ),
                                ),
                                Spacing(height: 3.h),
                                Text(
                                  'CARRIVE ?',
                                  style: AppTextStyles.bodyTitle.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                Spacing(height: 3.h),
                                Text(
                                  'Have an easy get start now',
                                  style: AppTextStyles.caption1.copyWith(
                                    color: AppColors.black_800,
                                  ),
                                ),
                                Spacing(height: 12.h),
                                CustomButton(
                                  isMedium: true,
                                  onTap: () {},
                                  label: "Search for a ride",
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/woman_and_man_on_a_moped.png",
                              height: 140.h,
                              width: 150.w,
                            ),
                          ],
                        ),
                      ),
                      Spacing(height: 24.h),
                      const Text('Explore Screen'),
                      Text(user.name),
                      Text(user.email),
                      Text('${user.userType}'),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 64.h,
                // color: AppColors.black_100,
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello,",
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.primarySource,
                          ),
                        ),
                        Spacing(height: 2.h),
                        Text(
                          user.name,
                          style: AppTextStyles.bodyTitle.copyWith(
                            color: AppColors.primarySource,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/notifications.svg',
                        height: 26.h,
                        width: 26.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const Center(
            //   child: Text('Explore Screen'),
            // ),
          ],
        ),
      ),
    );
  }
}
