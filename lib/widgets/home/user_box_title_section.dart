import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

import '../../common/resume_word.dart';

class UserBoxTitleSection extends StatefulWidget {
  const UserBoxTitleSection({Key? key}) : super(key: key);

  @override
  State<UserBoxTitleSection> createState() => _UserBoxTitleSectionState();
}

class _UserBoxTitleSectionState extends State<UserBoxTitleSection> {
  dynamic displayName;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        displayName = value.data()!['displayName'];
      });
    });
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Let's GO,",
            style: LetsGoTheme.Title,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              '$displayName!',
              style: LetsGoTheme.Title,
            ),
          ),
        ],
      ),
    );
  }
}
