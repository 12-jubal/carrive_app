import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/screens/profile/driver_ps.dart';
import 'package:carrive_app/src/presentation/screens/profile/passenger_ps.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return user.userType == UserType.passenger
        ? PassengerProfileScreen(user: user)
        : DriverProfileScreen(user: user);
  }
}
