import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class Option extends StatefulWidget {
  Option({
    super.key,
    this.onTap,
    this.iconString,
    required this.title,
    this.value,
    this.color,
    this.toggle,
    this.hasIcon = true,
    this.isOption = false,
    this.options,
    this.selectedValue,
    this.onChanged,
    this.isNumber = false,
    this.decrement,
    this.increment,
  });

  final Function()? onTap;
  final String title;
  final String? iconString;
  final String? value;
  final Color? color;
  final bool? toggle;
  final bool? hasIcon;
  final bool? isOption;
  final List<String>? options;
  String? selectedValue;
  final ValueChanged<String>? onChanged;
  final bool? isNumber;
  // final Function
  // final VoidCallback? decrement;
  void Function()? decrement, increment;

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
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
                  AppLocalizations.of(context)!.selectOption,
                  style: AppTextStyles.body1,
                ),
              ),
              Divider(height: 1.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.options != null ? widget.options!.length : 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ListTile(
                      title: Text(
                        widget.options != null ? widget.options![index] : '',
                        style: AppTextStyles.body2.copyWith(
                          color: widget.options != null
                              ? widget.options![index] == widget.selectedValue
                                  ? AppColors.primarySource
                                  : AppColors.black_600
                              : null,
                        ),
                      ),
                      onTap: () {
                        if (widget.options != null &&
                            widget.onChanged != null) {
                          setState(() {
                            widget.selectedValue = widget.options![index];
                            widget.onChanged!(widget.selectedValue!);
                          });
                        }

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
    return GestureDetector(
      onTap: widget.isOption == true ? _showOptionsBottomSheet : widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 4.h,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.hasIcon! == true)
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: SvgPicture.asset(
                      widget.iconString ?? '',
                      height: 24.h,
                      width: 24.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const Spacing(width: 12),
                  if (widget.value != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppTextStyles.body3.copyWith(
                            color: AppColors.black_900,
                          ),
                        ),
                        Text(
                          widget.value!,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.skyBlueSource,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      widget.title,
                      style: AppTextStyles.body3.copyWith(
                        color: AppColors.black_900,
                      ),
                    ),
                ],
              )
            else
              Text(
                widget.title,
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.black_900,
                ),
              ),
            if (widget.toggle != null)
              CustomToggle(
                isActive: widget.toggle ?? false,
              )
            else if (widget.isNumber == true)
              Row(
                children: [
                  GestureDetector(
                    onTap: widget.decrement,
                    child: SvgPicture.asset(
                      'assets/icons/remove.svg',
                      height: 22.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.black_700,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const Spacing(width: 12),
                  GestureDetector(
                    onTap: widget.increment,
                    child: SvgPicture.asset(
                      'assets/icons/add.svg',
                      height: 22.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.black_700,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              )
            else
              SvgPicture.asset(
                'assets/icons/forward.svg',
                colorFilter: const ColorFilter.mode(
                  AppColors.black_700,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
