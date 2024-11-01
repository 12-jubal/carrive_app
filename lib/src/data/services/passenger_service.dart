import 'dart:developer';
import 'package:carrive_app/src/data/models/conversation.dart';
import 'package:carrive_app/src/data/models/user.dart';
import 'package:carrive_app/src/helpers/api_helpers.dart';
import 'package:carrive_app/src/utils/constants/enums.dart';

class PassengerService {
  PassengerService._();

  String get passengerUrl {
    return 'http://192.168.100.8:8086';
  }

  static Future<void> passengerLogout() async {
    try {
      log('Calling API to logout passenger');
      final response = await APIService.instance.request(
        requiresToken: true,
        myBaseUrl: PassengerService._().passengerUrl,
        endpoint: '/passenger/logout',
        DioMethod.post,
      );
      if (response.statusCode == 200) {
        log('Passenger Logout Successful');
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
        myBaseUrl: PassengerService._().passengerUrl,
        endpoint: '/passenger/list-users',
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

  static Future<ConversationModel> initConversation(
      {required String idReceiver}) async {
    try {
      log('Calling API to initialize conversation');
      final response = await APIService.instance.request(
        requiresToken: true,
        myBaseUrl: PassengerService._().passengerUrl,
        endpoint: '/passenger/init-conversation?id_receiver=$idReceiver',
        DioMethod.post,
        // param: {
        //   'id_receiver': idReceiver,
        // },
      );
      if (response.statusCode == 200) {
        log('Conversation initialized successfully');
        var jsonResponse = response.data['data'];
        // var jsonResponse = response.data;
        ConversationModel conversation =
            ConversationModel.fromJson(jsonResponse);
        return conversation;
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
}
