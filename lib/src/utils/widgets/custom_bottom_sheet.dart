import 'dart:async';

import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/data/services/places_services.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/style/text_styles.dart';
import 'package:carrive_app/src/utils/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLocationBottomSheet extends StatefulWidget {
  // final List<Place> places;
  final String title;
  final String searchHintText;
  // // final TextEditingController textEditingController;
  // final ValueChanged<String> onTextChanged;
  // final bool isSearching;

  const CustomLocationBottomSheet({
    super.key,
    // required this.places,
    required this.title,
    required this.searchHintText,
    // required this.textEditingController,
    // required this.onTextChanged,
    // required this.isSearching,
  });

  static void showplaces(
    BuildContext context, {
    // required List<Place> places,
    required String title,
    required String searchHintText,
    // required TextEditingController textEditingController,
    // required ValueChanged<String> onTextChanged,
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
            // onTextChanged: onTextChanged,
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
  List<Place> listOfLocations = [];
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
                        'Back',
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
