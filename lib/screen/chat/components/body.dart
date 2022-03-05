import 'package:flutter/material.dart';
import 'package:letsgo/components/filled_outline_button.dart';
import 'package:letsgo/models/Chat.dart';
import 'package:letsgo/screen/messages/message_screen.dart';
import 'package:letsgo/theme/constants.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 20, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              const SizedBox(width: kDefaultPadding),
              FillOutlineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
