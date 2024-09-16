import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing extends StatelessWidget {
  final double width;
  final double height;

  const Spacing({
    super.key,
    this.width = 0,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
    );
  }
}
