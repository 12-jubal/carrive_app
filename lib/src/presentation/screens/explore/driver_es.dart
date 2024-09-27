import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/screens/create_ride_screen.dart';
import 'package:carrive_app/src/utils/app_navigator.dart';
import 'package:carrive_app/src/utils/spacing.dart';
import 'package:carrive_app/src/utils/style/colors.dart';
import 'package:carrive_app/src/utils/widgets/custom_appbar.dart';
import 'package:carrive_app/src/utils/widgets/leading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverExploreScreen extends StatelessWidget {
  final User user;
  const DriverExploreScreen({required this.user, super.key});

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
                        bgColor: AppColors.primary_200,
                        question: 'Do you want to create a',
                        imageLink: 'assets/images/delivery_guy.png',
                        btnLabel: 'Create a ride',
                        btnColor: AppColors.secondarySource,
                        onTap: () {
                          AppNavigator.push(context, const CreateRide());
                        },
                      ),
                      const Spacing(height: 24),
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
