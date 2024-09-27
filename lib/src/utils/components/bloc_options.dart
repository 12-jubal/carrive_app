import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocOption extends StatelessWidget {
  const BlocOption({
    super.key,
    required this.options,
  });

  final List<Widget> options;

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
        interleavedWidgets.add(
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: const Divider(
              color: AppColors.black_500,
              thickness: 0.5,
            ),
          ),
        );
        interleavedWidgets.add(SizedBox(height: 4.h));
      }
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.40,
            color: AppColors.black_700,
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
