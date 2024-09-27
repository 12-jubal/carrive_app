import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/leading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassengerExploreScreen extends StatelessWidget {
  final User user;
  const PassengerExploreScreen({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 64.h,
              left: 24.w,
              right: 24.w,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                  child: Column(
                    children: [
                      LeadingCard(
                        bgColor: AppColors.secondary_200,
                        question: 'Are you ready for a',
                        imageLink: 'assets/images/woman_and_man_on_a_moped.png',
                        btnLabel: 'Search for a ride',
                        btnColor: AppColors.primarySource,
                        onTap: () {},
                      ),
                      Spacing(height: 24.h),
                      const Text('Explore Screen'),
                      Text(user.name),
                      Text(user.email),
                      Text('${user.userType}'),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomExploreAppbar(
                username: user.name,
                hasNotification: true,
                onTap: () {},
              ),
            ),
            // const Center(
            //   child: Text('Explore Screen'),
            // ),
          ],
        ),
      ),
    );
  }
}
