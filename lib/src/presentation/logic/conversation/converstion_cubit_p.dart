import 'package:carrive_app/src/data/models/conversation.dart';
import 'package:carrive_app/src/data/services/driver_services.dart';
import 'package:carrive_app/src/presentation/logic/conversation/conversation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationCubit extends Cubit<ConversationState> {
  TextEditingController messageTextController = TextEditingController();
  final String idReceiver;
  ConversationCubit({required this.idReceiver}) : super(ConversationInitial()) {
    initConversation();
  }

  // initialize
  Future<void> initConversation() async {
    emit(ConversationLoading(message: 'Loading conversation...'));
    // print(idReceiver);
    // await Future.delayed(Duration(seconds: 2));
    ConversationModel conversation =
        await DriverServices.initConversation(idReceiver: idReceiver);
    print(conversation.idConversation);
    emit(ConversationLoaded(conversation: conversation));
  }

  Future<void> sendMessage(
      {required String idConversation, required String message}) async {
    emit(ConversationLoading(message: 'Sending message...'));
    // await Future.delayed(Duration(seconds: 2));
    // print(messageTextController.text);
    // print(state.conversation.idConversation);
    await DriverServices.sendMessage(
      idConversation: idConversation,
      content: message,
    );
    messageTextController.clear();
    initConversation();
  }
}
