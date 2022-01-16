import 'package:flutter/material.dart';

class LetsGoTheme{
  LetsGoTheme._();

  static const Color main = Color(0xff4614a5);
  static const Color second = Color(0xff4895ef);
  static const Color third = Color(0xff4614a5);
  static const Color fourth = Color(0xfff72685);
  static const Color fifth = Color(0xff2D2D2D);
  static const Color lightPurple = Color(0xffF8F4FF);
  static const Color black = Color(0xff111417);
  static const Color white = Colors.white;


  static const TextTheme textTheme = TextTheme(
    headline4: logoTitle,
  );

  static const TextStyle logoTitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 50.0,
    letterSpacing: 1.0,
    color: white,
  );
}