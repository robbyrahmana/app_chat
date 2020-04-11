class ChatItemModel {
  final String senderId;
  final String message;

  ChatItemModel({this.senderId, this.message});

  static List<ChatItemModel> list = [
    ChatItemModel(
      senderId: "1",
      message: "Hi Marti! do you have already reports?",
    ),
    ChatItemModel(
      senderId: "1",
      message: "Sure we can talk tomorrow",
    ),
    ChatItemModel(
      senderId: "1",
      message: "Hi Marti",
    ),
    ChatItemModel(
      senderId: "2",
      message: "I'd like to discuss about reports for kate",
    ),
    ChatItemModel(
      senderId: "2",
      message: "Are you available tomorrow at 3PM?",
    ),
    ChatItemModel(
      senderId: "2",
      message: "Hi jonathan",
    ),
  ];
}
