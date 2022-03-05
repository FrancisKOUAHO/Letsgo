import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/chat_params.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key, required this.chatParams}) : super(key: key);
  final ChatParams chatParams;

  @override
  _ChatState createState() => _ChatState(chatParams);
}

class _ChatState extends State<Chat> {
  _ChatState(this.chatParams);

  final ChatParams chatParams;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  int _nbElement = 20;
  static const int PAGINATION_INCREMENT = 20;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    listScrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (listScrollController.offset >= listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _nbElement += PAGINATION_INCREMENT;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            buildListMessage(),
            buildInput()
          ],
        ),
      ],
    );
  }

  Widget buildListMessage() {
    return Container();
  }

  Widget buildInput() {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black, width: 0.5)), color: Colors.white),
      child: Row(
        children: [
          Material(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: const Icon(Icons.image),
                onPressed: getImage,
                color: Colors.blueGrey,
              ),
            ),
            color: Colors.white,
          ),
          Flexible(
            child: TextField(
              onSubmitted: (value) {
                onSendMessage(textEditingController.text, 0);
              },
              style: const TextStyle(color: Colors.blueGrey, fontSize: 15.0),
              controller: textEditingController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Your message...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          // Button send message
          Material(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => onSendMessage(textEditingController.text, 0),
                color: Colors.blueGrey,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Future getImage() async {
    // TODO get and send image
  }

  void onSendMessage(String content, int type) {
    // TODO send message
  }
}