import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTextStyles {
  // Preventing instantiation
  AppTextStyles._();

  // Heading Styles
  static TextStyle h1 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 32.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w800, //bold
  );
  static TextStyle h2 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w600, // Semi bold
  );
  static TextStyle h3 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400, //Medium
  );
  static TextStyle h4 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 20.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400, //Medium
  );
  static TextStyle h5 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 20.sp,
    color: AppColors.black,
  );

  // Body Styles
  static TextStyle bodyTitle = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600, // Semi Bold
    color: AppColors.black,
  );
  static TextStyle body1 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400, // Medium
    color: AppColors.black,
  );
  static TextStyle body2 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 16.sp,
    color: AppColors.black,
  );
  static TextStyle body3 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 14.sp,
    color: AppColors.black,
  );

  // Caption Styles
  static TextStyle caption1 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 12.sp,
    color: AppColors.black,
  );
  static TextStyle caption2 = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontSize: 10.sp,
    color: AppColors.black,
  );
}
