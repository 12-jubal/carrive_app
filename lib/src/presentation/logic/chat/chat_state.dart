import 'package:carrive_app/src/data/models/user.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  final String message;

  ChatLoading({required this.message});
}

class ChatLoaded extends ChatState {
  final List<User> users;

  ChatLoaded({required this.users});
}

class ChatError extends ChatState {
  final String message;

  ChatError({required this.message});
}
