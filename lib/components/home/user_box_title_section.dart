import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserBoxTitleSection extends StatelessWidget {
  const UserBoxTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;

    print(user);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("Let's GO"),
            Text("Francis!")
          ],
        ),
      ),
    );
  }
}
