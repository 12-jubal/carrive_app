import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocOption extends StatelessWidget {
  const BlocOption({
    super.key,
    required this.options,
    this.fullSeparator = false,
  });

  final List<Widget> options;
  final bool? fullSeparator;

  @override
  Widget build(BuildContext context) {
    // Interleaves widgets with a separator and spacing
    List<Widget> interleavedWidgets = [];

    for (int i = 0; i < options.length; i++) {
      interleavedWidgets.add(options[i]);

      // Add separator and spacing after every widget except the last one
      // Or don't add spacing and separator if there's only one widget
      if (i != options.length - 1) {
        interleavedWidgets.add(SizedBox(height: 4.h));
        if (fullSeparator! == true) {
          interleavedWidgets.add(
            const Divider(
              color: AppColors.black_500,
              thickness: 0.4,
            ),
          );
          interleavedWidgets.add(SizedBox(height: 4.h));
        } else {
          interleavedWidgets.add(
            Padding(
              padding: EdgeInsets.only(left: 60.w),
              child: const Divider(
                color: AppColors.black_500,
                thickness: 0.4,
              ),
            ),
          );
          interleavedWidgets.add(SizedBox(height: 4.h));
        }
      }
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.4.h,
            color: AppColors.black_500,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: interleavedWidgets,
      ),
    );
  }
}
