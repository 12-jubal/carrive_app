import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConversationActions extends StatelessWidget {
  const ConversationActions({
    super.key,
    required this.onChange,
    required this.messageTextController,
    required this.onSendMessage,
    required this.onVoiceRecord,
    required this.onPhotoCamera,
  });

  final void Function(String) onChange;
  final TextEditingController messageTextController;
  final void Function() onSendMessage;
  final void Function() onVoiceRecord;
  final void Function() onPhotoCamera;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 16.h,
        bottom: 40.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomTextField(
              expands: true,
              hint: locale.typeMessage,
              onChanged: onChange,
              textEditingController: messageTextController,
            ),
          ),
          const Spacing(width: 12),
          GestureDetector(
            onTap: onSendMessage,
            child: SvgPicture.asset(
              "assets/icons/send.svg",
              height: 28.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primarySource,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Spacing(width: 6),
          GestureDetector(
            onTap: onVoiceRecord,
            child: SvgPicture.asset(
              "assets/icons/mic.svg",
              height: 28.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primarySource,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Spacing(width: 6),
          GestureDetector(
            onTap: onPhotoCamera,
            child: SvgPicture.asset(
              'assets/icons/photo_camera_back.svg',
              height: 28.h,
              width: 24.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primarySource,
                BlendMode.srcIn,
              ),
            ),
          )
          // CustomButton(onTap: () {}, label: 'Type Message')
        ],
      ),
    );
  }
}
