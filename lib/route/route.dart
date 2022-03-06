import 'package:flutter/material.dart';
import 'package:letsgo/screen/chat/chat_home.dart';
import 'package:letsgo/screen/splash/splash_screen.dart';

import '../models/chat_params.dart';
import '../screen/chat/chat_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/chat_home':
        return MaterialPageRoute(builder: (context) =>  ChatHome());
      case '/chat':
        var arguments = settings.arguments;
        if (arguments != null) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ChatScreen(chatParams: arguments as ChatParams),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation =
                    CurvedAnimation(curve: Curves.ease, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        } else {
          return MaterialPageRoute(
              builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("Error"), centerTitle: true),
                  body: const Center(
                    child: Text("Page not found"),
                  )));
        }
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(title: const Text("Error"), centerTitle: true),
                body: const Center(
                  child: Text("Page not found"),
                )));
    }
  }
}
