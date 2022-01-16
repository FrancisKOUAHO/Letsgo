import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/route/route.dart' as route;
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(child: Text("CommunityScreen")),
    );
  }
}
