import 'package:carrive_app/src/data/models/message.dart';
import 'package:carrive_app/src/data/models/user.dart';

class ConversationModel {
  late final String idConversation;
  late final List<Message> messages;
  // user1= driver ; user2= passenger
  late final User user1;
  late final User user2;

  ConversationModel({
    required this.idConversation,
    required this.messages,
    required this.user1,
    required this.user2,
  });

  ConversationModel.fromJson(Map<String, dynamic> json) {
    idConversation = json['id'];
    messages = json['messages'] != null
        ? (json['messages'] as List)
            .map((messageJson) => Message.fromJson(messageJson))
            .toList()
        : [];
    user1 = User.fromJson(json['user1']);
    user2 = User.fromJson(json['user2']);
  }
}
