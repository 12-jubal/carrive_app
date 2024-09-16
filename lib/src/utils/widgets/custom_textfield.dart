import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.initialValue = '',
    this.obscureText,
    this.validationType,
    this.keyboardType,
    required this.onChanged,
    required this.textEditingController,
  });

  final String label, hint;
  final String initialValue;
  bool? obscureText;
  TextInputType? keyboardType;
  final ValidationType? validationType;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: AppTextStyles.body2.copyWith(
                color: AppColors.black_900,
              ),
            ),
            const Spacing(width: 4),
            if (widget.validationType == null)
              const SizedBox()
            else if (widget.validationType == ValidationType.valid)
              SvgPicture.asset(
                "assets/icons/checked_filled.svg",
                height: 16.h,
                width: 16.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.green_700,
                  BlendMode.srcIn,
                ),
              )
            else
              SvgPicture.asset(
                "assets/icons/cancel_filled.svg",
                height: 16.h,
                width: 16.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.red_700,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
        const Spacing(height: 6),
        TextFormField(
          // initialValue: initialValue,
          style: AppTextStyles.body2,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          obscureText: widget.obscureText ?? false,
          obscuringCharacter: '*',
          onChanged: widget.onChanged,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.primary_100,
            hintText: widget.hint,
            hintStyle: AppTextStyles.body2.copyWith(
              color: AppColors.black_500,
            ),
            suffix: widget.obscureText != null
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText!;
                      });
                    },
                    child: SvgPicture.asset(
                      widget.obscureText == true
                          ? "assets/icons/eye_on.svg"
                          : "assets/icons/eye_off.svg",
                      height: 18.h,
                      width: 18.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.black_500,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.dm),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primary_700,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.dm),
              ),
            ),
            errorBorder: widget.validationType == ValidationType.invalid
                ? OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.red_700,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.dm),
                    ),
                  )
                : null,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          ),
        ),
      ],
    );
  }
}

class CustomPinput extends StatelessWidget {
  const CustomPinput({
    super.key,
    required this.label,
    required this.pinController,
  });

  final String label;
  final TextEditingController pinController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body2.copyWith(
            color: AppColors.black_900,
          ),
        ),
        const Spacing(height: 6),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: 5,
            controller: pinController,
            defaultPinTheme: PinTheme(
              width: 54.w,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              textStyle: AppTextStyles.body2,
              decoration: BoxDecoration(
                color: AppColors.primary_100,
                borderRadius: BorderRadius.circular(8.dm),
                border: Border.all(
                  color: AppColors.primary_100,
                ),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 54.w,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              textStyle: AppTextStyles.body2,
              decoration: BoxDecoration(
                color: AppColors.primary_100,
                borderRadius: BorderRadius.circular(8.dm),
                border: Border.all(
                  color: AppColors.primary_700,
                ),
              ),
            ),

            // Add the named parameter 'androidSmsAutofillMethod'
          ),
        ),
      ],
    );
  }
}