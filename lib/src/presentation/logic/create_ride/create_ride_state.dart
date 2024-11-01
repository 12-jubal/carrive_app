import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/data/models/ride.dart';

class CreateRideState {
  final PlaceSuggestions? pickupLocation;
  final PlaceSuggestions? destinationLocation;
  final double price;
  final double distance;
  final String? billing;
  final DateTime? departureDate;
  final DateTime? departureTime;
  final String? vehicle;
  final int numberOfPlaces;
  final bool allowExpedition;

  const CreateRideState({
    this.pickupLocation,
    this.destinationLocation,
    this.price = 00.00,
    this.distance = 00.00,
    this.billing,
    this.departureDate,
    this.departureTime,
    this.vehicle,
    this.numberOfPlaces = 1,
    this.allowExpedition = false,
  });

  CreateRideState copyWith({
    PlaceSuggestions? pickupLocation,
    PlaceSuggestions? destinationLocation,
    double? price,
    double? distance,
    String? billing,
    DateTime? departureDate,
    DateTime? departureTime,
    String? vehicle,
    int? numberOfPlaces,
    bool? allowExpedition,
  }) {
    return CreateRideState(
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      price: price ?? this.price,
      distance: distance ?? this.distance,
      billing: billing ?? this.billing,
      departureDate: departureDate ?? this.departureDate,
      departureTime: departureTime ?? this.departureTime,
      vehicle: vehicle ?? this.vehicle,
      numberOfPlaces: numberOfPlaces ?? this.numberOfPlaces,
      allowExpedition: allowExpedition ?? this.allowExpedition,
    );
  }
}

class CreateRideInitial extends CreateRideState {}

class CreateRideLoading extends CreateRideState {
  final String message;

  const CreateRideLoading({required this.message});
}

class SearchPlaceLoading extends CreateRideState {}

class CreateRideSuccess extends CreateRideState {
  final Ride ride;

  const CreateRideSuccess({required this.ride});
}

class CreateRideError extends CreateRideState {
  final String message;

  const CreateRideError({required this.message});
}

class ConfirmRideCreation extends CreateRideState {}
