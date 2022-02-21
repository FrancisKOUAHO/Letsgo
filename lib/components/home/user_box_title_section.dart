import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class UserBoxTitleSection extends StatelessWidget {
  const UserBoxTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("Let's GO"),
            Text("Marina!")
          ],
        ),
      ),
    );
  }
}
