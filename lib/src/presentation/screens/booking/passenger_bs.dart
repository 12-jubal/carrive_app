import 'package:carrive_app/src/data/models/user.dart';
import 'package:flutter/material.dart';

class PassengerBookingScreen extends StatelessWidget {
  final User user;
  const PassengerBookingScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user.userType.toString()),
      ),
    );
  }
}
