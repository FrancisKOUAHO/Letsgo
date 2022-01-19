import 'package:flutter/material.dart';

class GridListCommunity extends StatefulWidget {
  const GridListCommunity({Key? key}) : super(key: key);

  @override
  _GridListCommunityState createState() => _GridListCommunityState();
}

class _GridListCommunityState extends State<GridListCommunity> {

  List<String> images = [
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
    "assets/Splash.png",
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(images[index]);
        },
      ),
    );
  }
}
