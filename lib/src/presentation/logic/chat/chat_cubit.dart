import 'package:carrive_app/src/presentation/logic/chat/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  TextEditingController searchTextEditingController = TextEditingController();
  ChatCubit() : super(ChatInitial());
}
