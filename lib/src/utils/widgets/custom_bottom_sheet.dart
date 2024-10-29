import 'dart:async';
import 'dart:developer';

import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/data/services/places_services.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_buttons.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLocationBottomSheet extends StatefulWidget {
  // final List<Place> places;
  final String title;
  final String searchHintText;
  // // final TextEditingController textEditingController;
  final ValueChanged<PlaceSuggestions> onTextChanged;
  // final bool isSearching;

  const CustomLocationBottomSheet({
    super.key,
    // required this.places,
    required this.title,
    required this.searchHintText,
    // required this.textEditingController,
    required this.onTextChanged,
    // required this.isSearching,
  });

  static void showplaces(
    BuildContext context, {
    // required List<Place> places,
    required String title,
    required String searchHintText,
    // required TextEditingController textEditingController,
    required ValueChanged<PlaceSuggestions> onTextChanged,
    // required bool isSearching,
  }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CustomLocationBottomSheet(
            // places: places,
            title: title,
            searchHintText: searchHintText,
            // textEditingController: textEditingController,
            onTextChanged: onTextChanged,
            // isSearching: isSearching,
          );
        });
  }

  @override
  State<CustomLocationBottomSheet> createState() =>
      _CustomLocationBottomSheetState();
}

class _CustomLocationBottomSheetState extends State<CustomLocationBottomSheet> {
  final TextEditingController searchEditingController = TextEditingController();
  List<PlaceSuggestions> listOfLocations = [];
  // We create this timer variable to execute the search after a particular number of secs
  Timer? _debounce;
  // Bool for checking if the search is loading
  bool isLoading = false;

  @override
  void initState() {
    searchEditingController.addListener(() {
      _onChange();
    });
    super.initState();
  }

  _onChange() {
    placesuggestions(searchEditingController.text);
  }

  void placesuggestions(String input) {
    // Cancel the previous timer
    isLoading = true;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () async {
      var places = await PlaceService.placeSuggestions(place: input);
      isLoading = false;
      setState(() {
        listOfLocations = places;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      height: 0.8.sh,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: AppColors.primary_100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => AppNavigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18.h,
                        width: 18.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.skyBlueSource,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Spacing(width: 2),
                      Text(
                        locale.back,
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.skyBlueSource,
                        ),
                      )
                    ],
                  ),
                ),
                Text(widget.title, style: AppTextStyles.body1),
                SizedBox(width: 56.w),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
            child: Column(
              children: [
                CustomSearchField(
                  hint: widget.searchHintText,
                  textEditingController: searchEditingController,
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                const Spacing(height: 16),
                Visibility(
                  visible: isLoading,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 8,
                    ),
                  ),
                ),
                Visibility(
                  visible: searchEditingController.text.isEmpty ? false : true,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfLocations.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.onTextChanged(listOfLocations[index]);
                              log(listOfLocations[index].mainText);

                              AppNavigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4.r),
                                    height: 26.h,
                                    width: 26.w,
                                    decoration: const BoxDecoration(
                                      color: AppColors.redSource,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/near_me_filled.svg',
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  const Spacing(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listOfLocations[index].mainText,
                                          style: AppTextStyles.body3.copyWith(
                                            color: AppColors.black_900,
                                          ),
                                        ),
                                        Text(
                                          listOfLocations[index].description,
                                          style:
                                              AppTextStyles.caption1.copyWith(
                                            color: AppColors.skyBlueSource,
                                          ),
                                          // overflow: TextOverflow
                                          //     .clip, // Add lines to the text
                                          overflow: TextOverflow
                                              .ellipsis, // Adds the ellipsis (three dots)
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacing(height: 4),
                          if (index != listOfLocations.length - 1)
                            Container(
                              padding: EdgeInsets.only(left: 52.w),
                              child: const Divider(
                                color: AppColors.black_500,
                                thickness: 0.3,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomOptionBottomSheet extends StatefulWidget {
  CustomOptionBottomSheet({
    super.key,
    required this.title,
    required this.onChanged,
    required this.options,
    this.selectedValue,
  });

  final String title;
  final List<String> options;
  final ValueChanged<String> onChanged;
  String? selectedValue;

  static void showOptionsBottomSheet(
    BuildContext context, {
    required String title,
    required List<String> options,
    required ValueChanged<String> onChanged,
    String? selectedValue,
  }) {
    showModalBottomSheet(
      context: context,
      // backgroundColor: Colors.transparent, // Make the background transparent
      builder: (context) {
        return CustomOptionBottomSheet(
          title: title,
          onChanged: onChanged,
          options: options,
        );
      },
    );
  }

  @override
  State<CustomOptionBottomSheet> createState() =>
      _CustomOptionBottomSheetState();
}

class _CustomOptionBottomSheetState extends State<CustomOptionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      // height: 0.8.sh,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: AppColors.primary_100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => AppNavigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18.h,
                        width: 18.w,
                        colorFilter: const ColorFilter.mode(
                          AppColors.skyBlueSource,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Spacing(width: 2),
                      Text(
                        locale.back,
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.skyBlueSource,
                        ),
                      )
                    ],
                  ),
                ),
                Text(widget.title, style: AppTextStyles.body1),
                SizedBox(width: 56.w),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
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
  }
}

class CustomButtonBottom extends StatefulWidget {
  const CustomButtonBottom({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    this.primaryonTap,
    this.secondaryonTap,
  });

  final String primaryText, secondaryText;
  final void Function()? primaryonTap, secondaryonTap;

  static void showOptions(
    BuildContext context, {
    required String primaryText,
    required String secondaryText,
    required void Function()? primaryonTap,
    required void Function()? secondaryonTap,
  }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CustomButtonBottom(
            primaryText: primaryText,
            secondaryText: secondaryText,
            primaryonTap: primaryonTap,
            secondaryonTap: secondaryonTap,
          );
        });
  }

  @override
  State<CustomButtonBottom> createState() => _CustomButtonBottomState();
}

class _CustomButtonBottomState extends State<CustomButtonBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 0.4.sh,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            onTap: () => widget.primaryonTap,
            label: widget.primaryText,
          ),
          const Spacing(height: 24),
          CustomButton(
            onTap: () => widget.secondaryonTap,
            label: widget.secondaryText,
            bgcolor: Colors.transparent,
            textColor: AppColors.primarySource,
          ),
          const Spacing(height: 12),
        ],
      ),
    );
  }
}
