import 'package:bottom_picker/bottom_picker.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateTimePicker {
  static void showDatePicker(BuildContext context,
      {required String title, required Function(dynamic)? onSubmit}) {
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
      minDateTime: DateTime.now(),
      dateOrder: DatePickerDateOrder.ymd,
      onSubmit: onSubmit,
    ).show(context);
  }

  static void showTimePicker(BuildContext context,
      {required String title, required Function(dynamic)? onSubmit}) {
    BottomPicker.time(
      pickerTitle: Padding(
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        child: Text(
          title,
          style: AppTextStyles.body1,
        ),
      ),
      onSubmit: onSubmit,
      initialTime: Time.now(),
    ).show(context);
  }
}
