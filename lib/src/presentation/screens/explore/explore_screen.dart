import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/screens/explore/driver_es.dart';
import 'package:carrive_app/src/presentation/screens/explore/passenger_es.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final User user;
  const ExploreScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return user.userType == UserType.passenger
        ? PassengerExploreScreen(user: user)
        : DriverExploreScreen(user: user);
  }
}
