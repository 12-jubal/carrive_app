class DriverExploreState {}

class DriverExploreInitial extends DriverExploreState {}

class DriverExploreLoading extends DriverExploreState {}

class DriverExploreFailure extends DriverExploreState {
  final String message;

  DriverExploreFailure({required this.message});
}

class DriverExploreSuccess extends DriverExploreState {
  // final List<Ride> rides;
  // final List<Ride> completedRides;
  // final List<Ride> ongoingRides;
  // final List<Ride> upcomingRides;

  // const DriverExploreSuccess({
  //   required this.rides,
  //   required this.completedRides,
  //   required this.ongoingRides,
  //   required this.upcomingRides,
  // });
}
