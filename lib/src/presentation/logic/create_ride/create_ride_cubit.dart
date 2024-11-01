import 'dart:developer';
import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/models/place.dart';
import 'package:carrive_app/src/data/models/ride.dart';
import 'package:carrive_app/src/data/services/driver_services.dart';
import 'package:carrive_app/src/data/services/places_services.dart';
import 'package:carrive_app/src/presentation/logic/create_ride/create_ride_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRideCubit extends Cubit<CreateRideState> {
  AppLocalizations localizations;
  CreateRideCubit({
    required this.localizations,
  }) : super(CreateRideInitial());

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

  // Handle departure date
  DateTime onDepartureDateSelected(DateTime date) {
    emit(state.copyWith(departureDate: date));
    return date;
  }

  // Handle departure time
  DateTime onDepartureTimeSelected(DateTime time) {
    emit(state.copyWith(departureTime: time));
    return time;
  }

  // Handle choosing car
  String onCarSelect(String selectedCar) {
    emit(state.copyWith(vehicle: selectedCar));
    return selectedCar;
  }

  // Handling permissions
  void onPermissionClick() {
    bool updatedAccept = !state.allowExpedition;
    emit(state.copyWith(allowExpedition: updatedAccept));
  }

  // increment places
  void increment() {
    int capacity = state.numberOfPlaces + 1;
    emit(state.copyWith(numberOfPlaces: capacity));
  }

  // decrement places
  void decrement() {
    int capacity = state.numberOfPlaces > 1 ? state.numberOfPlaces - 1 : 1;
    emit(state.copyWith(numberOfPlaces: capacity));
  }

  double convertDistance(int meters) {
    double kilometers = meters / 1000;
    return kilometers;
  }

  double calculatePrice(double distanceInKm) {
    double baseFare = 5.0;
    double perKmRate = 1.5;
    return baseFare + (distanceInKm * perKmRate);
  }

  void placeDetails() async {
    final pickUp = state.pickupLocation;
    final destinationPlace = state.destinationLocation;
    final price = state.price;
    final date = state.departureDate;
    final time = state.departureTime;
    final car = state.vehicle;
    final allowBaggage = state.allowExpedition;
    final capacity = state.numberOfPlaces;
    PlaceSuggestions? origin = state.pickupLocation;
    PlaceSuggestions? destination = state.destinationLocation;
    emit(CreateRideLoading(message: localizations.calculatingPrice));
    emit(state.copyWith(
      pickupLocation: pickUp,
      destinationLocation: destinationPlace,
      price: price,
      departureDate: date,
      departureTime: time,
      vehicle: car,
      allowExpedition: allowBaggage,
      numberOfPlaces: capacity,
    ));
    if (origin != null && destination != null) {
      try {
        // Get the coordinates of the places
        PlaceDetail originDetails =
            await PlaceService.placeDetails(placeId: origin.placeId);
        PlaceDetail destinationDetails =
            await PlaceService.placeDetails(placeId: destination.placeId);

        // Calculate distance between them
        PlaceDistDur dist = await PlaceService.placeDistance(
            origins: originDetails, destinations: destinationDetails);
        // log(dist.distance.toString());
        double distance = convertDistance(dist.distance);
        double price = calculatePrice(distance);

        emit(state.copyWith(
          pickupLocation: origin,
          destinationLocation: destination,
          price: price,
          distance: distance,
        ));
        emit(state.copyWith(
          // pickupLocation: pickUp,
          // destinationLocation: destinationPlace,
          // price: price,
          departureDate: date,
          departureTime: time,
          vehicle: car,
          allowExpedition: allowBaggage,
          numberOfPlaces: capacity,
        ));

        // print('Total Fare: \$${price.toStringAsFixed(2)}');
      } catch (e) {
        log(e.toString());
        emit(CreateRideError(message: e.toString()));
      }
    } else {
      emit(state.copyWith(
        pickupLocation: origin,
        destinationLocation: destination,
      ));
      emit(CreateRideError(message: localizations.selectPockupAndDestination));
    }
  }

  void createRide({
    required String date,
    required String time,
    required double price,
    required String pickUp,
    required String destination,
    // required String car,
    required bool allowBaggage,
    required int capacity,
    required double distance,
  }) async {
    emit(CreateRideLoading(message: localizations.creatingRide));

    try {
      Ride ride = await DriverServices.createRide(
        startDate: date,
        startTime: time,
        tariff: price, //double
        startCity: pickUp,
        destinationCity: destination,
        capacity: capacity, // int
        distance: distance, //int
        acceptPackage: allowBaggage,
        isPublished: true,
      );
      emit(CreateRideSuccess(ride: ride));
    } catch (e) {
      emit(CreateRideError(message: e.toString()));
      // emit(state.copyWith(
      //   pickupLocation: pickUp,
      //   destinationLocation: destination,
      //   price: price,
      //   departureDate: date,
      //   departureTime: time,
      //   vehicle: car,
      //   allowExpedition: allowBaggage,
      //   numberOfPlaces: capacity,
      //   distance: distance,
      // ));
    }
  }

  void saveRide() async {
    emit(CreateRideLoading(message: localizations.creatingRide));
    if (checkfields()) {
      final pickUp = state.pickupLocation!.mainText;
      final destination = state.destinationLocation!.mainText;
      final price = double.parse(state.price.toStringAsFixed(2));
      final date = state.departureDate?.toString().split(' ')[0] ??
          DateTime.now().toString().split(' ')[0];
      final time =
          state.departureTime?.toString().split(' ')[1].split('.')[0] ??
              DateTime.now().toString().split(' ')[1].split('.')[0];

      // final car = state.vehicle;
      final allowBaggage = state.allowExpedition;
      final capacity = state.numberOfPlaces;
      final distance = state.distance;
      // emit(state.copyWith()); // Maintain the state if any field is empty

      try {
        Ride ride = await DriverServices.createRide(
          startDate: date,
          startTime: time,
          tariff: price,
          startCity: pickUp,
          destinationCity: destination,
          capacity: capacity,
          distance: distance,
          acceptPackage: allowBaggage,
          isPublished: false,
        );
        emit(CreateRideSuccess(ride: ride));
      } catch (e) {
        emit(CreateRideError(message: e.toString()));
      }
    }
  }

  bool checkfields() {
    final pickUp = state.pickupLocation;
    final destination = state.destinationLocation;
    final price = state.price;
    final date = state.departureDate;
    final time = state.departureTime;
    final car = state.vehicle;
    final allowBaggage = state.allowExpedition;
    final capacity = state.numberOfPlaces;
    final distance = state.distance;
    if (pickUp == null ||
        destination == null ||
        price == 00.00 ||
        date == null ||
        time == null ||
        car == null ||
        distance == 00.00) {
      log('Pickup Location: $pickUp');
      log('Destination Location: $destination');
      log('Price: $price');
      log('Departure Date: $date');
      log('Departure Time: $time');
      log('Vehicle: $car');
      log('Allow Expedition: $allowBaggage');
      log('Number of Places: $capacity');
      log('Distance: $distance');
      emit(CreateRideError(message: localizations.completeCreation));
      emit(state.copyWith(
        pickupLocation: pickUp,
        destinationLocation: destination,
        price: price,
        departureDate: date,
        departureTime: time,
        vehicle: car,
        allowExpedition: allowBaggage,
        numberOfPlaces: capacity,
        distance: distance,
      ));
      return true;
    } else {
      // emit(state.copyWith());
      emit(ConfirmRideCreation());
      emit(state.copyWith(
        pickupLocation: pickUp,
        destinationLocation: destination,
        price: price,
        departureDate: date,
        departureTime: time,
        vehicle: car,
        allowExpedition: allowBaggage,
        numberOfPlaces: capacity,
        distance: distance,
      ));
      return false;
    }
  }

  // final CreateRideUseCase _createRideUseCase;

  // Future<void> createRide(CreateRideRequest request) async {
  //   emit(CreateRideLoading());
  //   final result = await _createRideUseCase(request);
  //   result.fold(
  //     (failure) => emit(CreateRideError(failure)),
  //     (success) => emit(CreateRideSuccess(success)),
  //   );
  // }
}
