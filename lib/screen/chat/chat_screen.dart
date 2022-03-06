import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/models/chat_params.dart';

import '../../common/resume_word.dart';
import '../../theme/constants.dart';
import 'chat.dart';


class ChatScreen extends StatelessWidget {
  final ChatParams chatParams;

  const ChatScreen({Key? key, required this.chatParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: [
            const BackButton(),
             CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ?? 'https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png'),
            ),
            const SizedBox(width: kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.displayName ?? '', style: const TextStyle(fontSize: 13)),
                const Text("Active 3m ago",
                  style: TextStyle(fontSize: 9),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.local_phone),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      body: Chat(chatParams: chatParams),
    );
  }
}