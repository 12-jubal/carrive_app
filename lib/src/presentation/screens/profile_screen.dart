import 'package:carrive_app/src/data/models/user.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Profile Screen'),
              Text(user.name),
              Text(user.email),
              Text('${user.userType}'),
            ],
          ),
        ),
      ),
    );
  }
}
