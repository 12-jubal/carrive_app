import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showUserTypeToast({
    required ToastType type,
    required String message,
  }) {
    switch (type) {
      case ToastType.error:
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.redSource,
          textColor: AppColors.white,
          fontSize: 15.sp,
        );
        break;
      case ToastType.info:
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.blueSource,
          textColor: AppColors.white,
          fontSize: 15.sp,
        );
        break;
      case ToastType.success:
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.greenSource,
          textColor: AppColors.white,
          fontSize: 15.sp,
        );
        break;
      case ToastType.warning:
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.yellowSource,
          textColor: AppColors.black,
          fontSize: 15.sp,
        );
        break;
    }
  }
}
