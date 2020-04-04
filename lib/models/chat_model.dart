import 'package:app_chat/models/contact_model.dart';

class ChatModel {
  final bool isTyping;
  final String lastMessage;
  final String lastMessageTime;
  final ContactModel contact;

  ChatModel(
      {this.isTyping, this.lastMessage, this.lastMessageTime, this.contact});

  static List<ChatModel> list = [
    ChatModel(
      isTyping: true,
      lastMessage: "hello!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Martin Valencia"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "Sure, no problem Jhon!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Maria Illescas"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "thank you Jhon!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Kate Stranger"),
    ),
  ];
}
