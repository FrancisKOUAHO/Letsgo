import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class UserBoxTitleSection extends StatelessWidget {
  const UserBoxTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (kDebugMode) {
      print(user);
    }return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Let's GO",
            style: LetsGoTheme.Title,
          ),
          Text("${user?.displayName}!",
            style: LetsGoTheme.Title,
          ),
        ],
      ),
    );
  }
}
