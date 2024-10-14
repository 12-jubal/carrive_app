import 'package:bottom_picker/bottom_picker.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDatePicker {
  static void showDatePicker(BuildContext context, {required String title}) {
    BottomPicker.date(
      pickerTitle: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        child: Text(
          title,
          style: AppTextStyles.body1,
        ),
      ),
      dateOrder: DatePickerDateOrder.ymd,
    ).show(context);
  }
}
