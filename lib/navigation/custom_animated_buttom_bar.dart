import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/screen/home/home.dart';
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
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const CommunityScreen()
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
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
                _currentIndex = index;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: screenWidth * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == _currentIndex ? screenWidth * .13 : 0,
                      width: index == _currentIndex ? screenWidth * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == _currentIndex
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
                    color: index == _currentIndex
                        ? Colors.white
                        : LetsGoTheme.main,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.location_on_rounded,
    Icons.groups,
  ];
}
