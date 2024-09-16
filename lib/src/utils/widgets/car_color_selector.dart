import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CarColorSelector extends StatefulWidget {
  CarColorSelector({
    super.key,
    required this.selectedColor,
    required this.onTap,
  });
  // To track the currently selected color
  Color? selectedColor;
  final void Function(Color) onTap;

  @override
  State<CarColorSelector> createState() => _CarColorSelectorState();
}

class _CarColorSelectorState extends State<CarColorSelector> {
  // List of car Colors to display
  final List<Color> carColors = [
    AppColors.primarySource,
    AppColors.secondarySource,
    AppColors.black,
    AppColors.greenSource,
    AppColors.redSource,
    AppColors.black_300,
    AppColors.yellowSource,
    AppColors.orangeSource
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Car Color',
          style: AppTextStyles.body2.copyWith(
            color: AppColors.black_900,
          ),
        ),
        const Spacing(height: 6),
        Wrap(
          spacing: 13.5.w,
          children: carColors.map((color) {
            // Have a variable for checking if a color is selected so that
            // we change the widget accordingly.
            final isSelected = widget.selectedColor == color;
            return GestureDetector(
              onTap:
                  // widget.onTap,
                  () {
                setState(() {
                  widget.selectedColor = color; // update the color chosen
                  widget.onTap(widget.selectedColor!);
                });
                // print(widget.selectedColor);
              },
              child: isSelected
                  ? SvgPicture.asset(
                      'assets/icons/checked_filled.svg',
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                        color,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/icons/uncheck_filled.svg',
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                        color,
                        BlendMode.srcIn,
                      ),
                    ),
            );
          }).toList(),
        )
      ],
    );
  }
}
