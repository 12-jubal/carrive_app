import 'package:carrive_app/src/data/models/ride.dart';

class SearchRideState {}

class SearchRideInitial extends SearchRideState {}

class SearchRideLoading extends SearchRideState {
  final String message;

  SearchRideLoading({required this.message});
}

class SearchRideLoaded extends SearchRideState {
  final List<Ride> rides;

  SearchRideLoaded({required this.rides});
}
