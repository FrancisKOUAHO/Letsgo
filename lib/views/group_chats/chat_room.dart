import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/chats_theme.dart';
import '../../theme/constants.dart';

class ChatRoom extends StatelessWidget {
  final Map<String, dynamic> userMap;
  final String chatRoomId;

  ChatRoom({Key? key, required this.chatRoomId, required this.userMap})
      : super(key: key);

  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  dynamic data;

  File? imageFile;

  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = const Uuid().v1();
    int status = 1;

    await FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .doc(fileName)
        .set({
      "sendby": data.data()!['displayName'],
      "message": "",
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    });

    var ref =
        FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
      await FirebaseFirestore.instance
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .update({"message": imageUrl});

      if (kDebugMode) {
        print("imageUrl $imageUrl");
      }
    }
  }

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": data.data()!['displayName'],
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _message.clear();
      await FirebaseFirestore.instance
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      if (kDebugMode) {
        print("Entrez du texte");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      data = value;
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 100,
          centerTitle: true,
          title: StreamBuilder<DocumentSnapshot>(
            stream:
                _firestore.collection("users").doc(userMap['uid']).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        userMap['displayName'],
                        style: const TextStyle(color: LetsGoTheme.black),
                      ),
                      Text(
                        snapshot.data!['status'],
                        style: const TextStyle(
                            fontSize: 12, color: LetsGoTheme.black),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
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
                      icon: const FaIcon(
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 1.25,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chatroom')
                    .doc(chatRoomId)
                    .collection('chats')
                    .orderBy("time", descending: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> map = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        return messages(size, map, context);
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
                                decoration: InputDecoration(
                                  hintText: "Type de message",
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    onPressed: () => getImage(),
                                    icon: const Icon(Icons.photo, color: kPrimaryColor,),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: kDefaultPadding / 4),
                            IconButton(
                                icon: const Icon(Icons.send, color: kPrimaryColor,),
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

  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    var isMe = map['sendby'] == data.data()!['displayName'];
    return map['type'] == "text"
        ? Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      decoration: BoxDecoration(
                          color: isMe ? MyTheme.kAccentColor : Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: Radius.circular(isMe ? 12 : 0),
                            bottomRight: Radius.circular(isMe ? 0 : 12),
                          )),
                      child: Text(
                        map["message"],
                        style: MyTheme.bodyTextMessage.copyWith(
                            color: isMe ? Colors.white : Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        const SizedBox(
                          width: 40,
                        ),
                      Icon(
                        Icons.done_all,
                        size: 20,
                        color: MyTheme.bodyTextTime.color,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "11:20",
                        style: MyTheme.bodyTextTime,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            height: size.height / 2.5,
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            alignment: map['sendby'] == data.data()!['displayName']
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ShowImage(
                    imageUrl: map['message'],
                  ),
                ),
              ),
              child: Container(
                height: size.height / 2.5,
                width: size.width / 2,
                decoration: BoxDecoration(border: Border.all()),
                alignment: map['message'] != "" ? null : Alignment.center,
                child: map['message'] != ""
                    ? Image.network(
                        map['message'],
                        fit: BoxFit.cover,
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          );
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}
