import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/services/driver_services.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  TextEditingController searchTextEditingController = TextEditingController();
  final AppLocalizations locale;
  ChatCubit({required this.locale}) : super(ChatInitial()) {
    init();
  }

  // void chats() async {
  //   emit(ChatLoading(message: locale.loadingChats));
  //   try {
  //     final conversations = await DriverServices.getConversations();
  //     print(conversations);
  //     emit(ConversationsLoaded(conversations: conversations));
  //   } catch (e) {
  //     emit(ChatError(message: e.toString()));
  //   }
  // }

  void init() async {
    emit(ChatLoading(message: locale.loadingChats));
    try {
      final userList = await DriverServices.getUsers();
      final conversations = await DriverServices.getConversations();
      print(conversations);
      emit(SectionLoaded(
        users: userList,
        conversations: conversations,
      ));
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }
}
