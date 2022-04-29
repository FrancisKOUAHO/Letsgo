import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class UserBoxTitleSection extends StatefulWidget {
  const UserBoxTitleSection({Key? key}) : super(key: key);

  @override
  State<UserBoxTitleSection> createState() => _UserBoxTitleSectionState();
}

class _UserBoxTitleSectionState extends State<UserBoxTitleSection> {
  dynamic data;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        data = value;
      });
    });
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Let's GO",
            style: LetsGoTheme.Title,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              data.data()!['displayName'] ?? '',
              style: LetsGoTheme.Title,
            ),
          ),
        ],
      ),
    );
  }
}
