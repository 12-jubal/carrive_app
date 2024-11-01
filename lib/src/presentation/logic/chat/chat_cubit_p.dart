import 'package:carrive_app/l10n/app_localizations.dart';
import 'package:carrive_app/src/data/services/passenger_service.dart';
import 'package:carrive_app/src/presentation/logic/chat/chat_state_p.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PChatCubit extends Cubit<PChatState> {
  TextEditingController searchTextEditingController = TextEditingController();
  final AppLocalizations locale;
  PChatCubit({required this.locale}) : super(PChatInitial()) {
    init();
  }

  void init() async {
    emit(PChatLoading(message: locale.loadingChats));
    try {
      final userList = await PassengerService.getUsers();
      final conversations = await PassengerService.getConversations();
      print(conversations);
      emit(PSectionLoaded(
        users: userList,
        conversations: conversations,
      ));
    } catch (e) {
      emit(PChatError(message: e.toString()));
    }
  }
}
