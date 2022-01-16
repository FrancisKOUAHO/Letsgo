import 'package:flutter/material.dart';

import 'package:letsgo/screen/home/home.dart';
import 'package:letsgo/screen/home/home_screen.dart';
import 'package:letsgo/screen/splash/splash_screen.dart';
import 'package:letsgo/screen/community/community_screen.dart';
import 'package:letsgo/screen/search/search_screen.dart';

// ROUTE NAMES
const String splashScreen = 'splash';
const String home = 'home';
const String homeScreen = 'homeScreen';
const String searchScreen = 'search';
const String communityScreen = 'community';

// CONTROL OUR PAGE ROUTE FLOW
Route<dynamic> controller(RouteSettings setting) {
  switch (setting.name) {
    case splashScreen:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case home:
      return MaterialPageRoute(builder: (context) => Home());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case searchScreen:
      return MaterialPageRoute(builder: (context) => SearchScreen());
    case communityScreen:
      return MaterialPageRoute(builder: (context) => CommunityScreen());
    default:
      throw ('This route name does not exist');
  }
}