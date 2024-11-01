import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.otherUserName,
    required this.time,
    required this.lastMessage,
    required this.hasRead,
    required this.onTap,
  });

  final String otherUserName;
  final String time;
  final String lastMessage;
  final bool hasRead;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 8.h),
        decoration: const BoxDecoration(
            // border: Border.only()
            ),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: const ShapeDecoration(
                color: AppColors.blue_200,
                shape: CircleBorder(),
              ),
              child: Center(
                child: Text(
                  otherUserName[0],
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.blueSource,
                  ),
                ),
              ),
            ),
            const Spacing(width: 12),
            Expanded(
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment:
                    //     MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        otherUserName,
                        style: AppTextStyles.body1,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            time,
                            style: AppTextStyles.caption1.copyWith(
                              color: AppColors.black_500,
                            ),
                          ),
                          const Spacing(width: 6),
                          SvgPicture.asset(
                            'assets/icons/chevron_forward.svg',
                            height: 16.h,
                            width: 16.w,
                            colorFilter: const ColorFilter.mode(
                              AppColors.black_500,
                              BlendMode.srcIn,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacing(height: 4),
                  if (hasRead == false)
                    Text(
                      lastMessage,
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.black_500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  else
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            lastMessage,
                            style: AppTextStyles.caption1.copyWith(
                              color: AppColors.black_500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const Spacing(width: 4),
                        Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: const ShapeDecoration(
                            color: AppColors.secondarySource,
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
