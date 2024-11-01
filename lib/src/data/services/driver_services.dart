import 'dart:developer';
import 'package:carrive_app/src/data/models/ride.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/helpers/api_helpers.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

class DriverServices {
  DriverServices._();

  String get driverUrl {
    return 'https://2b00-154-72-162-124.ngrok-free.app';
  }

  static Future<Ride> createRide({
    required String startDate,
    required String startTime,
    required double tariff,
    required String startCity,
    required String destinationCity,
    required int capacity,
    required double distance,
    required bool acceptPackage,
    required bool isPublished,
  }) async {
    // Ride ride;
    try {
      log('Calling API to create ride');
      final response = await APIService.instance.request(
          requiresToken: true,
          myBaseUrl: DriverServices._().driverUrl,
          DioMethod.post,
          endpoint: '/driver/create-itinerary',
          param: {
            "startDate": startDate,
            "startTime": startTime,
            "tariff": tariff,
            "startCity": startCity,
            "destinationCity": destinationCity,
            "capacity": capacity,
            "distance": distance,
            "acceptedPackage": acceptPackage,
            "isPublished": isPublished,
          });
      if (response.statusCode == 200) {
        var jsonResponse = response.data['data'];
        Ride ride = Ride.fromJson(jsonResponse);
        return ride;
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  static Future<void> driverLogout() async {
    try {
      log('Calling API to logout driver');
      final response = await APIService.instance.request(
        requiresToken: true,
        myBaseUrl: DriverServices._().driverUrl,
        endpoint: '/driver/logout',
        DioMethod.post,
      );
      if (response.statusCode == 200) {
        log('Driver Logout Successful');
        // return true;
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  static Future<List<User>> getUsers() async {
    try {
      log('Calling API to get list of users');
      final response = await APIService.instance.request(
        requiresToken: true,
        myBaseUrl: DriverServices._().driverUrl,
        endpoint: '/driver/list-users',
        DioMethod.post,
      );
      if (response.statusCode == 200) {
        var jsonResponse = response.data['data'];
        // log('jsonResponse data type: ${jsonResponse.runtimeType}');
        // Use .map() to transform each item in jsonResponse to a User instance
        // List<User> users =
        //     jsonResponse.map((user) => User.fromJson(user)).toList();
        // return users;
        List<User> users = [];
        for (var user in jsonResponse) {
          users.add(User.fromJson(user));
          // print(user);
        }
        return users;
        // if (jsonResponse != null && jsonResponse is List) {

        // } else {
        //   log('Error: Data field is not a list or is null');
        //   throw Exception('Data field is not a list or is null');
        // }
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  static Future<bool> initConversation({required String idReceiver}) async {
    try {
      log('Calling API to initialize conversation');
      final response = await APIService.instance.request(
        requiresToken: true,
        myBaseUrl: DriverServices._().driverUrl,
        endpoint: '/driver/init-conversation',
        DioMethod.post,
        param: {
          "id_receiver": idReceiver,
        },
      );
      if (response.statusCode == 200) {
        log('Conversation initialized successfully');
        return true;
      } else {
        log('${response.statusCode}: ${response.statusMessage}');
        throw Exception('${response.statusCode}: ${response.statusMessage}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
