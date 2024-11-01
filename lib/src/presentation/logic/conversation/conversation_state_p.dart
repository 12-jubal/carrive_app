import 'package:carrive_app/src/data/models/conversation.dart';

class PConversationState {}

class PConversationInitial extends PConversationState {}

class PConversationLoading extends PConversationState {
  final String message;

  PConversationLoading({required this.message});
}

class PConversationLoaded extends PConversationState {
  final ConversationModel conversation;

  PConversationLoaded({required this.conversation});
}

class PConversationError extends PConversationState {
  final String message;

  PConversationError({required this.message});
}
