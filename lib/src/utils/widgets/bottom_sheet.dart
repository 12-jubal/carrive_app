import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showOptionsBottomSheet({
  required BuildContext context,
  required List<String> options,
  required String selectedValue,
  required ValueChanged<String?> onChanged,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
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
              itemCount: options.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListTile(
                    title: Text(
                      options[index],
                      style: TextStyle(
                        color: options[index] == selectedValue
                            ? Colors
                                .blue // Replace with AppColors.primarySource
                            : Colors.black, // Replace with AppColors.black_600
                      ),
                    ),
                    onTap: () {
                      onChanged(options[index]);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
            const SizedBox(
                height: 16), // Replace with your Spacing widget if needed
          ],
        ),
      );
    },
  );
}
