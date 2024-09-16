import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/text_styles.dart';

class CustomScreen extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String loadingMessage;

  const CustomScreen({
    super.key,
    required this.isLoading,
    required this.loadingMessage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          if (isLoading)
            Container(
              color: AppColors.black.withOpacity(0.5),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                height: 100.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.dm),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.05),
                      offset: const Offset(0.0, 20.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator.adaptive(
                      strokeWidth: 8,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      loadingMessage,
                      style: AppTextStyles.caption1,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
