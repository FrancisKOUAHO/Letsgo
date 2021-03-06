import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/letsgo_theme.dart';
import '../community/community_screen.dart';
import '../chats/chat_screen.dart';
import '../search/search_screen.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _widgetOptions = [
    const Home(),
    const SearchScreen(),
    const ChatScreen(),
    const CommunityScreen(),
  ];

  List<String> listOfIcons = [
    "assets/Icons_v3/maison.svg",
    "assets/Icons_v3/marqueur.svg",
    "assets/Icons_v3/commenter.svg",
    "assets/Icons_v3/users.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LetsGoTheme.white,
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: customAnimatedButtomBar(context),
    );
  }

  Container customAnimatedButtomBar(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .100),
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
                width: screenWidth * .1725,
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
                width: screenWidth * .1700,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  listOfIcons[index],
                  width: 27,
                  color:
                      index == _currentIndex ? Colors.white : LetsGoTheme.main,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
