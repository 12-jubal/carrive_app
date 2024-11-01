import 'package:carrive_app/src/utils/constants/enums.dart';

class Ride {
  late String id;
  late String startDate;
  late String startTime;
  late double tariff;
  late String startCity;
  late String destinationCity;
  late int capacity;
  late double distance;
  late RideStatus status;
  late bool? acceptPakage;
  late bool? isPublished;

  Ride({
    required this.id,
    required this.startDate,
    required this.startTime,
    required this.tariff,
    required this.startCity,
    required this.destinationCity,
    required this.capacity,
    required this.distance,
    required this.status,
    required this.acceptPakage,
    required this.isPublished,
  });

  RideStatus typeFromString(String rideStatus) {
    switch (rideStatus) {
      case 'CREATED':
        return RideStatus.created;
      case 'PENDING':
        return RideStatus.ongoing;
      case 'SUCCESS':
        return RideStatus.compeleted;
      default:
        return RideStatus.failed;
    }
  }

  Ride.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    startTime = json['startTime'];
    tariff = json['tariff'];
    startCity = json['startCity'];
    destinationCity = json['destinationCity'];
    capacity = json['capacity'];
    distance = json['distance'];
    status = typeFromString(json['status']);
    acceptPakage = json['acceptPakage'];
    isPublished = json['isPublished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startDate'] = startDate;
    data['startTime'] = startTime;
    data['tariff'] = tariff;
    data['startCity'] = startCity;
    data['destinationCity'] = destinationCity;
    data['capacity'] = capacity;
    data['distance'] = distance;
    data['status'] = status;
    data['acceptPakage'] = acceptPakage;
    data['isPublished'] = isPublished;

    return data;
  }
}
