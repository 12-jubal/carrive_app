class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  final String message;

  ChatLoading({required this.message});
}

class ChatLoaded extends ChatState {}

class ChatError extends ChatState {
  final String message;

  ChatError({required this.message});
}
