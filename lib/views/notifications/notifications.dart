import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

import '../../widgets/custom_return_appbar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late int currentSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomReturnAppBar('Notification'),
      ),
      body: Center(
        child: Text(
          'Fonctionnalité bientôt disponible',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      /* ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: ListTile(
                selected: index != null,
                title: const Text(
                  "Title",
                  style: TextStyle(color: LetsGoTheme.black),
                ),
                subtitle: const Text("Description",
                    style: TextStyle(color: LetsGoTheme.black)),
              ),
              decoration: currentSelectedIndex == index
                  ? BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(color: Colors.black))
                  : BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      border: Border.all(color: Colors.black)),
            ),
          );
        },
      ),*/
    );
  }
}