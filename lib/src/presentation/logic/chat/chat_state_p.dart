import 'package:carrive_app/src/data/models/conversation.dart';
import 'package:carrive_app/src/data/models/user.dart';

class PChatState {}

class PChatInitial extends PChatState {}

class PChatLoading extends PChatState {
  final String message;

  PChatLoading({required this.message});
}

class PSectionLoaded extends PChatState {
  final List<User> users;
  final List<ConversationModel> conversations;

  PSectionLoaded({required this.users, required this.conversations});
}

class PChatLoaded extends PChatState {
  final List<User> users;

  PChatLoaded({required this.users});
}

class PConversationsLoaded extends PChatState {
  final List<ConversationModel> conversations;

  PConversationsLoaded({required this.conversations});
}

class PChatError extends PChatState {
  final String message;

  PChatError({required this.message});
}
