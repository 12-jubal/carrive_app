import 'package:carrive_app/src/data/models/place.dart';

class CreateRideState {}

class CreateRideInitial extends CreateRideState {}

class CreateRideLoading extends CreateRideState {}

class SearchPlaceLoading extends CreateRideState {}

class CreateRideSuccess extends CreateRideState {
  final List<Place> places;

  CreateRideSuccess(this.places);
}

class CreateRideError extends CreateRideState {
  final String message;

  CreateRideError({required this.message});
}
