import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../theme/letsgo_theme.dart';
import '../chat_screen.dart';

class CreateGroup extends StatefulWidget {
  final List<Map<String, dynamic>> membersList;

  const CreateGroup({required this.membersList, Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final TextEditingController _groupName = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  void createGroup() async {
    setState(() {
      isLoading = true;
    });

    String groupId = const Uuid().v1();

    await FirebaseFirestore.instance.collection('groups').doc(groupId).set({
      "members": widget.membersList,
      "id": groupId,
    });

    for (int i = 0; i < widget.membersList.length; i++) {
      String uid = widget.membersList[i]['uid'];

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('groups')
          .doc(groupId)
          .set({
        "name": _groupName.text,
        "id": groupId,
      });
    }

    await FirebaseFirestore.instance
        .collection('groups')
        .doc(groupId)
        .collection('chats')
        .add({
      "message": "${_auth.currentUser!.displayName} a créé ce groupe.",
      "type": "notify",
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ChatScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                  },
                  child:  Text("Retour",
                      style: TextStyle(
                          color: LetsGoTheme.main,
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        Container(
          height: size.height / 14,
          width: size.width,
          alignment: Alignment.center,
          child: SizedBox(
            height: size.height / 14,
            width: size.width / 1.15,
            child: TextField(
              controller: _groupName,
              decoration: InputDecoration(
                hintText: "Entrer le nom du groupe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height / 50,
        ),
        ElevatedButton(
          onPressed: createGroup,
          child: const Text("Créer un groupe"),
        ),
      ],
    );
  }
}
