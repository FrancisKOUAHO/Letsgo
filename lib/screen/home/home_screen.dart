import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(child: Text("HomeScreen")),
    );
  }
}
