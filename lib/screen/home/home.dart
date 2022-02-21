import 'package:flutter/material.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
