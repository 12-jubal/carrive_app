import 'package:carrive_app/src/data/models/conversation.dart';

class ConversationState {}

class ConversationInitial extends ConversationState {}

class ConversationLoading extends ConversationState {
  final String message;

  ConversationLoading({required this.message});
}

class ConversationLoaded extends ConversationState {
  final ConversationModel conversation;

  ConversationLoaded({required this.conversation});
}

class ConversationError extends ConversationState {
  final String message;

  ConversationError({required this.message});
}
