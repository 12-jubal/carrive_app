import 'package:carrive_app/src/data/models/conversation.dart';
import 'package:carrive_app/src/data/models/user.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  final String message;

  ChatLoading({required this.message});
}

class SectionLoaded extends ChatState {
  final List<User> users;
  final List<ConversationModel> conversations;

  SectionLoaded({required this.users, required this.conversations});
}

class ChatLoaded extends ChatState {
  final List<User> users;

  ChatLoaded({required this.users});
}

class ConversationsLoaded extends ChatState {
  final List<ConversationModel> conversations;

  ConversationsLoaded({required this.conversations});
}

class ChatError extends ChatState {
  final String message;

  ChatError({required this.message});
}
