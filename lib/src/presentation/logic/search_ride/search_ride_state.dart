import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/data/models/ride.dart';

class SearchRideState {
  final DateTime? departureTime;
  final DateTime? departureDate;
  final PlaceSuggestions? pickupLocation;
  final PlaceSuggestions? destinationLocation;

  const SearchRideState({
    this.departureDate,
    this.departureTime,
    this.pickupLocation,
    this.destinationLocation,
  });

  SearchRideState copyWith({
    PlaceSuggestions? pickupLocation,
    PlaceSuggestions? destinationLocation,
    DateTime? departureTime,
    DateTime? departureDate,
  }) {
    return SearchRideState(
      departureDate: departureDate ?? this.departureDate,
      departureTime: departureTime ?? this.departureTime,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
    );
  }
}

class SearchRideInitial extends SearchRideState {}

class SearchRideLoading extends SearchRideState {
  final String message;

  SearchRideLoading({required this.message});
}

class SearchRideLoaded extends SearchRideState {
  final List<Ride> rides;

  SearchRideLoaded({required this.rides});
}
