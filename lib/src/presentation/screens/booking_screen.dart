import 'package:carrive_app/src/data/models/user.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final User user;
  const BookingScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Booking Screen'),
      ),
    );
  }
}
