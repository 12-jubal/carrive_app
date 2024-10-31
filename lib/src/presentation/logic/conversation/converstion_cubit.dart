import 'package:carrive_app/src/presentation/logic/conversation/conversation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationCubit extends Cubit<ConversationState> {
  TextEditingController messageTextController = TextEditingController();
  ConversationCubit() : super(ConversationInitial());
}
