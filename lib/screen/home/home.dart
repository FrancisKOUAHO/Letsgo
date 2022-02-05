import 'package:flutter/material.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomAnimatedButtomBar(),
    );
  }
}
