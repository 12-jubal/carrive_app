import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomExploreAppbar extends StatelessWidget {
  const CustomExploreAppbar({
    required this.username,
    required this.hasNotification,
    required this.onTap,
    super.key,
  });

  final String username;
  final bool hasNotification;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                username,
                style: AppTextStyles.bodyTitle.copyWith(
                  color: AppColors.primarySource,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              hasNotification
                  ? 'assets/icons/notifications_unread.svg'
                  : 'assets/icons/notifications.svg',
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
    );
  }
}

class CustomProfileAppbar extends StatelessWidget {
  const CustomProfileAppbar({
    super.key,
    required this.title,
    required this.shadow,
    this.leading,
    this.onLeadingTap,
    this.trailing,
    this.onTrailingTap,
  });

  final String title;
  final bool shadow;
  final Widget? leading, trailing;
  final Function()? onLeadingTap, onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      decoration: shadow
          ? BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black_600.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            )
          : const BoxDecoration(
              color: AppColors.white,
            ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onTrailingTap,
              child: SizedBox(
                width: 128.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (trailing != null)
                      trailing is Text
                          ? DefaultTextStyle(
                              style: AppTextStyles.body2.copyWith(
                                color: AppColors.skyBlueSource,
                              ),
                              child: trailing!,
                            )
                          : trailing!
                    else
                      SizedBox(
                        width: 64.w,
                      ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: AppTextStyles.bodyTitle.copyWith(
                color: AppColors.primarySource,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onLeadingTap,
                child: SizedBox(
                  width: 64.w,
                  child: (leading != null)
                      ? (leading is Text)
                          ? DefaultTextStyle(
                              style: AppTextStyles.body2.copyWith(
                                color: AppColors.skyBlueSource,
                              ),
                              child: leading ?? const SizedBox(),
                            )
                          : leading
                      : SizedBox(
                          width: 64.w,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.shadow,
    this.leading,
    this.onLeadingTap,
    this.trailing,
    this.onTrailingTap,
  });

  final String title;
  final bool shadow;
  final Widget? leading, trailing;
  final Function()? onLeadingTap, onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      width: 1.sw,
      height: 56.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      decoration: shadow
          ? BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black_600.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            )
          : const BoxDecoration(
              color: AppColors.white,
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onLeadingTap,
            child: SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (leading != null)
                    if (leading is Text)
                      DefaultTextStyle(
                        style: AppTextStyles.body2.copyWith(
                          color: AppColors.skyBlueSource,
                        ),
                        child: leading ?? const SizedBox(),
                      )
                    else
                      leading ?? const SizedBox()
                  else
                    SizedBox(
                      width: 80.w,
                    ),
                ],
              ),
            ),
          ),
          Text(
            title,
            style: AppTextStyles.bodyTitle.copyWith(
              color: AppColors.primarySource,
            ),
          ),
          GestureDetector(
            onTap: onTrailingTap,
            child: SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (trailing != null)
                    trailing is Text
                        ? DefaultTextStyle(
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.skyBlueSource,
                            ),
                            child: trailing!,
                          )
                        : trailing!
                  else
                    SizedBox(
                      width: 80.w,
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

class ConversationAppBar extends StatelessWidget {
  const ConversationAppBar({super.key, required this.otherUserName});
  final String otherUserName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(
        top: 72.h,
        left: 24.w,
        right: 24.w,
        bottom: 16.h,
      ),
      color: AppColors.primary_100,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              AppNavigator.pop(context);
            },
            child: SvgPicture.asset(
              "assets/icons/back.svg",
              height: 20.h,
              width: 20.w,
              colorFilter: const ColorFilter.mode(
                AppColors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Spacing(width: 12),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: const ShapeDecoration(
              color: AppColors.primary_300,
              shape: CircleBorder(),
            ),
            child: Center(
              child: Text(
                otherUserName[0],
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.primarySource,
                ),
              ),
            ),
          ),
          const Spacing(width: 12),
          Text(
            otherUserName,
            style: AppTextStyles.body1.copyWith(
              color: AppColors.primarySource,
            ),
          ),
        ],
      ),
    );
  }
}
