import 'package:carrive_app/src/data/models/user.dart';

class Message {
  late final String idMessage;
  late final User sender;
  late final User receiver;
  late final String content;
  late final DateTime time;
  late final DateTime date;

  Message(
      {required this.idMessage,
      required this.sender,
      required this.receiver,
      required this.content,
      required this.time,
      required this.date});

  Message.fromJson(Map<String, dynamic> json) {
    idMessage = json['id'];
    sender = User.fromJson(json['sender']);
    receiver = User.fromJson(json['receiver']);
    content = json['content'];
    time = DateTime.parse("2024-01-01T${json['sendTime']}");
    date = DateTime.parse(json['sendDate']);
  }
}
