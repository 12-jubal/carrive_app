import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/presentation/screens/chat/driver_chat.dart';
import 'package:carrive_app/src/presentation/screens/chat/passenger_chat.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final User user;
  const ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return user.userType == UserType.passenger
        ? PassengerChat(user: user)
        : DriverChat(user: user);
  }
}
