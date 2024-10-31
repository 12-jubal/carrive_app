class ConversationState {}

class ConversationInitial extends ConversationState {}

class ConversationLoading extends ConversationState {
  final String message;

  ConversationLoading({required this.message});
}

class ConversationLoaded extends ConversationState {
  // final List<User> users;

  // ConversationLoaded({required this.users});
}

class ConversationError extends ConversationState {
  final String message;

  ConversationError({required this.message});
}
