import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/screens/booking/driver_bs.dart';
import 'package:carrive_app/src/presentation/screens/booking/passenger_bs.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final User user;
  const BookingScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return user.userType == UserType.passenger
        ? PassengerBookingScreen(user: user)
        : DriverBookingScreen(user: user);
  }
}
