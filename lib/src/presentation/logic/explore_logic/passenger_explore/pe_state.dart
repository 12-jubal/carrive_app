class PassengerExploreState {}

class PassengerExploreInitial extends PassengerExploreState {}

class PassengerExploreLoading extends PassengerExploreState {}

class PassengerExploreFailure extends PassengerExploreState {
  final String message;

  PassengerExploreFailure({required this.message});
}

class PassengerExploreSuccess extends PassengerExploreState {
  // final List<Ride> rides;
  // final List<Ride> completedRides;
  // final List<Ride> ongoingRides;
  // final List<Ride> upcomingRides;

  // const PassengerExploreSuccess({
  //   required this.rides,
  //   required this.completedRides,
  //   required this.ongoingRides,
  //   required this.upcomingRides,
  // });
}
