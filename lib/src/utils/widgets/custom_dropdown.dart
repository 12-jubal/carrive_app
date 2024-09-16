// ignore: must_be_immutable
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  CustomDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.options,
    required this.onChanged,
    this.selectedValue,
  });

  final String label, hint;
  final List<String> options;
  final ValueChanged<String> onChanged;
  // final void Function(String) onChanged;
  String? selectedValue;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
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
                  "Select an Option",
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.body2.copyWith(
            color: AppColors.black_900,
          ),
        ),
        const Spacing(height: 6),
        GestureDetector(
          onTap: _showOptionsBottomSheet,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.primary_100,
              borderRadius: BorderRadius.circular(8.dm),
              border: Border.all(
                color: AppColors.primary_100,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.selectedValue ?? widget.hint,
                  style: AppTextStyles.body2.copyWith(
                    color: widget.selectedValue == null
                        ? AppColors.black_600
                        : AppColors.black_900,
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/downward.svg",
                  height: 18.h,
                  width: 18.w,
                  colorFilter: const ColorFilter.mode(
                    AppColors.black_500,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
