import 'package:flutter/material.dart';

import '../../widgets/custom_return_appbar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: CustomReturnAppBar('Notification'),
        ),
        body: Center(child: Text('aaaaa')));
  }
}
