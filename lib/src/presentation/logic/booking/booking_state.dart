class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {
  final String message;

  BookingLoading({required this.message});
}

class BookingError extends BookingState {
  final String message;

  BookingError({required this.message});
}

class BookingLoaded extends BookingState {}
