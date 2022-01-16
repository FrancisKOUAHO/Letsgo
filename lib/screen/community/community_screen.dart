import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("CommunityScreen")),
    );
  }
}
