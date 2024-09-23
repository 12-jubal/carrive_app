import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.isExplore,
    this.username,
    this.pageTitle,
    required this.assetName,
    required this.iconNumber,
    this.onTap,
    super.key,
  });

  final bool isExplore;
  final String? username, pageTitle;
  final String assetName;
  final void Function()? onTap;
  final int iconNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (isExplore)
                Text(
                  "Hello,",
                  style: AppTextStyles.caption1.copyWith(
                    color: AppColors.primarySource,
                  ),
                )
              else
                const SizedBox(),
              const Spacer(),
              ListView.builder(
                itemCount: iconNumber,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: onTap,
                    child: SvgPicture.asset(
                      'assets/icons/$assetName',
                      colorFilter: const ColorFilter.mode(
                        AppColors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              if (isExplore)
                Text(
                  username ?? '',
                  style: AppTextStyles.bodyTitle.copyWith(
                    color: AppColors.primarySource,
                  ),
                )
              else
                Text(
                  pageTitle ?? '',
                  style: AppTextStyles.bodyTitle.copyWith(
                    color: AppColors.primarySource,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
