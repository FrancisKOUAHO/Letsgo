import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/screen/home/home_screen.dart';
import 'package:letsgo/screen/search/search_screen.dart';
import 'package:letsgo/screen/community/community_screen.dart';
import 'package:letsgo/route/route.dart' as route;

class CustomAnimatedButtomBar extends StatefulWidget {
  const CustomAnimatedButtomBar({Key? key}) : super(key: key);

  @override
  _CustomAnimatedButtomBarState createState() =>
      _CustomAnimatedButtomBarState();
}

class _CustomAnimatedButtomBarState extends State<CustomAnimatedButtomBar> {
  int currentIndex = 0;
  final screen = [HomeScreen(), SearchScreen(), CommunityScreen()];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(20),
      height: screenWidth * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 3,

        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .120),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.pushNamed(context, route.homeScreen);
                break;
              case 1:
                Navigator.pushNamed(context, route.searchScreen);
                break;
              case 2:
                Navigator.pushNamed(context, route.communityScreen);
                break;
            }
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth * .2125,
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? screenWidth * .13 : 0,
                    width: index == currentIndex ? screenWidth * .2125 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? LetsGoTheme.main
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * .2125,
                alignment: Alignment.center,
                child: Icon(
                  listOfIcons[index],
                  size: screenWidth * .100,
                  color:
                      index == currentIndex ? Colors.white : LetsGoTheme.main,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.location_on_rounded,
    Icons.person_rounded,
  ];
}
