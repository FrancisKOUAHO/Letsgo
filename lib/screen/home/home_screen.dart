import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
            child: Text("HomeScreen")),
      ),
      bottomNavigationBar: CustomAnimatedButtomBar(),
    );
  }
}
