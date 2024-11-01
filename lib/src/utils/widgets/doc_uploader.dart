import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/utils/components/dash_border_painter.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class DocUploader extends StatefulWidget {
  final String uploadInstruction;
  final String supportedFormat;
  final List<String> options;
  final ValueChanged<String> onChanged;
  String? selectedValue;

  DocUploader({
    super.key,
    required this.uploadInstruction,
    required this.supportedFormat,
    required this.options,
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  State<DocUploader> createState() => _DocUploaderState();
}

class _DocUploaderState extends State<DocUploader> {
  void _showOptionsBottomSheet() {
    showModalBottomSheet(
      context: context,
      // backgroundColor: Colors.transparent, // Make the background transparent
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.dm),
              topRight: Radius.circular(16.dm),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  AppLocalizations.of(context)!.selectOption,
                  style: AppTextStyles.body1,
                ),
              ),
              Divider(height: 1.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ListTile(
                      title: Text(
                        widget.options[index],
                        style: AppTextStyles.body2.copyWith(
                          color: widget.options[index] == widget.selectedValue
                              ? AppColors.primarySource
                              : AppColors.black_600,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.selectedValue = widget.options[index];
                          widget.onChanged(widget.selectedValue!);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
              const Spacing(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showOptionsBottomSheet,
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: AppColors.black_500,
          strokeWidth: 0.7.h,
          dashWidth: 16.w,
          dashSpace: 12.w,
          radius: 8.r,
        ),
        child: Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(vertical: 24.h),
          decoration: ShapeDecoration(
            color: AppColors.skyBlue_100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary_200),
                child: SvgPicture.asset(
                  'assets/icons/upload_file.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primarySource,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const Spacing(height: 8),
              RichText(
                text: TextSpan(
                  text: widget.uploadInstruction.split('|')[0],
                  style: AppTextStyles.body3.copyWith(
                    color: AppColors.blueSource,
                    fontWeight: FontWeight.w800,
                  ),
                  children: [
                    TextSpan(
                      text: widget.uploadInstruction.split('|')[1],
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacing(height: 8),
              Text(
                widget.supportedFormat,
                style: AppTextStyles.caption2.copyWith(
                  color: AppColors.black_700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
