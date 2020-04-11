import 'package:app_chat/core/consts.dart';
import 'package:app_chat/models/chat_item_model.dart';
import 'package:app_chat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatItemPage extends StatefulWidget {
  @override
  _ChatItemPageState createState() => _ChatItemPageState();
}

class _ChatItemPageState extends State<ChatItemPage> {
  ChatModel currentChat = ChatModel.list.elementAt(0);
  String currentUser = "1";
  String pairId = "2";
  List<ChatItemModel> chatItems = ChatItemModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blueColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.blueColor,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          "${currentChat.contact.name}",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chatItems.length,
              reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: chatItems[index].senderId == currentUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: <Widget>[
                      _isFirstMessage(chatItems, index) &&
                              chatItems[index].senderId == pairId
                          ? Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                    "assets/default.jpg",
                                  ),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            )
                          : Container(
                              width: 30,
                              height: 30,
                            ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .7,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(
                              _isFirstMessage(chatItems, index) ? 0 : 10,
                            ),
                            bottomLeft: Radius.circular(
                              _isLastMessage(chatItems, index) ? 0 : 10,
                            ),
                          ),
                          color: chatItems[index].senderId == currentUser
                              ? AppColors.blueColor
                              : Colors.white38,
                        ),
                        child: Text(
                          "${chatItems[index].message}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (currentChat.isTyping)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SpinKitThreeBounce(
                        color: AppColors.blueColor,
                        size: 20.0,
                      ),
                    ],
                  ),
                  Text(
                    "${currentChat.contact.name} is typing...",
                    style: TextStyle(
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: _buildInput(),
    );
  }

  Widget _buildInput() {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.darkColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type something...",
                hintStyle: TextStyle(
                  color: Colors.white30,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.attach_file,
              color: AppColors.blueColor,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.alternate_email,
              color: AppColors.blueColor,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  _isFirstMessage(List<ChatItemModel> chatItems, int index) {
    return (chatItems[index].senderId !=
            chatItems[index - 1 < 0 ? 0 : index - 1].senderId) ||
        index == 0;
  }

  _isLastMessage(List<ChatItemModel> chatItems, int index) {
    int maxItem = chatItems.length - 1;
    return (chatItems[index].senderId !=
            chatItems[index + 1 > maxItem ? maxItem : index + 1].senderId) ||
        index == maxItem;
  }
}
