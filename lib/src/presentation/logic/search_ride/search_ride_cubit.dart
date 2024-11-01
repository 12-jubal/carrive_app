import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/presentation/logic/search_ride/search_ride_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRideCubit extends Cubit<SearchRideState> {
  SearchRideCubit() : super(SearchRideInitial());

  // Handle departure time
  DateTime onDepartureTimeSelected(DateTime time) {
    emit(state.copyWith(departureTime: time));
    return time;
  }

  // Handle departure date
  DateTime onDepartureDateSelected(DateTime date) {
    emit(state.copyWith(departureDate: date));
    return date;
  }

  // Handle pickup
  PlaceSuggestions onPickupSelected(PlaceSuggestions pickUp) {
    emit(state.copyWith(pickupLocation: pickUp));
    return pickUp;
  }

  // Handle destination
  PlaceSuggestions onDestinationSelected(PlaceSuggestions destination) {
    emit(state.copyWith(destinationLocation: destination));
    return destination;
  }
}
