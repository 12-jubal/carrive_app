import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/services/driver_services.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  TextEditingController searchTextEditingController = TextEditingController();
  final AppLocalizations locale;
  ChatCubit({required this.locale}) : super(ChatInitial()) {
    getUsers();
  }

  void chats() {}

  void getUsers() async {
    emit(ChatLoading(message: locale.loadingChats));
    final userList = await DriverServices.getUsers();
    emit(ChatLoaded(users: userList));
    // final users = await userRepository.getUsers();
    // List<User> mockUserList = [
    //   User(
    //     id: '1',
    //     name: 'Alice Johnson',
    //     email: 'alice@example.com',
    //     token: 'token_1',
    //     isActive: true,
    //     isConnected: true,
    //     isRegister: true,
    //     userType: UserType.driver,
    //     cars: [],
    //   ),
    //   User(
    //     id: '2',
    //     name: 'Bob Smith',
    //     email: 'bob@example.com',
    //     token: 'token_2',
    //     isActive: false,
    //     isConnected: false,
    //     isRegister: true,
    //     userType: UserType.passenger,
    //     cars: [],
    //   ),
    //   User(
    //     id: '3',
    //     name: 'Charlie Brown',
    //     email: 'charlie@example.com',
    //     token: 'token_3',
    //     isActive: true,
    //     isConnected: true,
    //     isRegister: true,
    //     userType: UserType.driver,
    //     cars: [],
    //   ),
    //   User(
    //     id: '4',
    //     name: 'Diana Prince',
    //     email: 'diana@example.com',
    //     token: 'token_4',
    //     isActive: false,
    //     isConnected: false,
    //     isRegister: true,
    //     userType: UserType.passenger,
    //     cars: [],
    //   ),
    //   User(
    //     id: '5',
    //     name: 'Eve Adams',
    //     email: 'eve@example.com',
    //     token: 'token_5',
    //     isActive: true,
    //     isConnected: true,
    //     isRegister: true,
    //     userType: UserType.driver,
    //     cars: [],
    //   ),
    //   User(
    //     id: '6',
    //     name: 'Frank Castle',
    //     email: 'frank@example.com',
    //     token: 'token_6',
    //     isActive: false,
    //     isConnected: false,
    //     isRegister: true,
    //     userType: UserType.passenger,
    //     cars: [],
    //   ),
    //   User(
    //     id: '7',
    //     name: 'Grace Hopper',
    //     email: 'grace@example.com',
    //     token: 'token_7',
    //     isActive: true,
    //     isConnected: true,
    //     isRegister: true,
    //     userType: UserType.driver,
    //     cars: [],
    //   ),
    //   User(
    //     id: '8',
    //     name: 'Hank Pym',
    //     email: 'hank@example.com',
    //     token: 'token_8',
    //     isActive: false,
    //     isConnected: false,
    //     isRegister: true,
    //     userType: UserType.passenger,
    //     cars: [],
    //   ),
    //   User(
    //     id: '9',
    //     name: 'Ivy Green',
    //     email: 'ivy@example.com',
    //     token: 'token_9',
    //     isActive: true,
    //     isConnected: true,
    //     isRegister: true,
    //     userType: UserType.driver,
    //     cars: [],
    //   ),
    // ];
  }
}
