import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../theme/chats_theme.dart';
import '../../theme/letsgo_theme.dart';

import '../../theme/constants.dart';
import 'group_info.dart';

class GroupChatRoom extends StatelessWidget {
  final String groupChatId, groupName;

  GroupChatRoom({required this.groupName, required this.groupChatId, Key? key})
      : super(key: key);

  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final bool _isRead = true;

  dynamic data;

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> chatData = {
        "sendBy": data.data()!['displayName'],
        "message": _message.text,
        "type": "text",
        "time": DateTime.now().millisecondsSinceEpoch.toString(),
      };

      _message.clear();

      await _firestore
          .collection('groups')
          .doc(groupChatId)
          .collection('chats')
          .add(chatData);
    }
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('dd MMM kk:mm');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} JOUR DERNIER';
      } else {
        time = '${diff.inDays} JOURS DERNIERS';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} SEMAINE DERNIÈRE';
      } else {
        time = '${(diff.inDays / 7).floor()} SEMAINES DERNIÈRES';
      }
    }

    return time;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      data = value;
      print("data $data");
    });

    return Scaffold(
      backgroundColor: LetsGoTheme.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        title: Text(groupName, style: TextStyle(color: LetsGoTheme.black)),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0x3A000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Container(
                  color: LetsGoTheme.lightPurple,
                  width: 45,
                  height: 45,
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      color: LetsGoTheme.main,
                    ),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 27, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: const Color(0x3A000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Container(
                    color: LetsGoTheme.lightPurple,
                    width: 45,
                    height: 45,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.ellipsisVertical,
                        color: LetsGoTheme.main,
                      ),
                      iconSize: 20.0,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => GroupInfo(
                              groupName: groupName,
                              groupId: groupChatId,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 1.27,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('groups')
                    .doc(groupChatId)
                    .collection('chats')
                    .orderBy('time')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> chatMap =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                        print('chatMap ${chatMap}');
                        bool isMe =
                            chatMap["sendBy"] == data.data()!['displayName'];
                        return Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text(
                                chatMap["sendBy"],
                                style: MyTheme.bodyTextMessageSendBy.copyWith(
                                    color: isMe
                                        ? Colors.white
                                        : Colors.grey[800]),
                              ),
                              Row(
                                mainAxisAlignment: isMe
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (!isMe)
                                    const CircleAvatar(
                                      radius: 15,
                                      backgroundImage: NetworkImage(
                                          'https://s1.o7planning.com/fr/12997/images/64425712.png'),
                                    ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.6),
                                    decoration: BoxDecoration(
                                        color: isMe
                                            ? MyTheme.kAccentColor
                                            : Colors.grey[200],
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(16),
                                          topRight: const Radius.circular(16),
                                          bottomLeft:
                                              Radius.circular(isMe ? 12 : 0),
                                          bottomRight:
                                              Radius.circular(isMe ? 0 : 12),
                                        )),
                                    child: Text(
                                      chatMap["message"],
                                      style: MyTheme.bodyTextMessage.copyWith(
                                          color: isMe
                                              ? Colors.white
                                              : Colors.grey[800]),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment: isMe
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    if (!isMe)
                                      const SizedBox(
                                        width: 40,
                                      ),
                                    _isRead == false
                                        ? Icon(
                                            Icons.done_all,
                                            size: 20,
                                            color: MyTheme
                                                .bodyTextTimeIsRead.color,
                                          )
                                        : Icon(
                                            Icons.done_all,
                                            size: 20,
                                            color: MyTheme.bodyTextTime.color,
                                          ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    _isRead == false
                                        ? Text(
                                        /*readTimestamp(int.parse(chatMap["time"]))*/
                                            DateFormat('dd MMM kk:mm').format(
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        int.parse(
                                                            chatMap["time"]))),
                                            style: MyTheme.bodyTextTimeIsRead,
                                          )
                                        : Text(
                                            DateFormat('dd MMM kk:mm').format(
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        int.parse(
                                                            chatMap["time"]))),
                                            style: MyTheme.bodyTextTime,
                                          )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 32,
                    color: const Color(0xFF087949).withOpacity(0.08),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    const Icon(Icons.mic, color: kPrimaryColor),
                    const SizedBox(width: kDefaultPadding),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: kDefaultPadding / 4),
                            Expanded(
                              child: TextField(
                                controller: _message,
                                decoration: const InputDecoration(
                                  hintText: "Type de message",
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.photo,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding / 4),
                            IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: kPrimaryColor,
                                ),
                                onPressed: onSendMessage,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!
                                    .withOpacity(0.64)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
