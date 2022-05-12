import 'package:flutter/material.dart';

class LetsGoTheme {
  LetsGoTheme._();

  static const Color main = Color(0xff7208b7);
  static const Color second = Color(0xff4895ef);
  static const Color third = Color(0xff4614a5);
  static const Color fourth = Color(0xfff72685);
  static const Color green = Color(0xff119d0b);
  static const Color amber = Color(0xffF7BF29);
  static const Color red = Color(0xffe00707);
  static const Color fifth = Color(0xff2D2D2D);
  static const Color lightPurple = Color(0xffF8F4FF);
  static const Color black = Color(0xff111417);
  static const Color lightGrey = Color(0xff979797);
  static const Color white = Colors.white;
  static const Color transparent = Color(0x00000000);
  static const Color whiteTransparent = Color(0xC5FDFBFB);

  static const TextTheme textTheme = TextTheme(
    headline4: logoTitle,
  );

  static const TextStyle logoTitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 55.0,
    letterSpacing: 1.0,
    color: LetsGoTheme.white,
  );

  static const TextStyle selectTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 25.0,
    letterSpacing: 1.0,
    color: LetsGoTheme.white,
  );

  static const TextStyle selectSubTitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 12.0,
    color: LetsGoTheme.white,
  );

  static const TextStyle Title = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: LetsGoTheme.black,
  );

  static const TextStyle subTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: LetsGoTheme.black,
  );

  static const TextStyle loginTitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 35,
    letterSpacing: 0.7,
    color: LetsGoTheme.white,
  );

  static const TextStyle resetPasswordTitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 22.5,
    letterSpacing: 0.7,
    color: LetsGoTheme.white,
  );

  static const TextStyle bigTitle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 28,
    letterSpacing: 0.7,
    color: LetsGoTheme.black,
  );

  static const TextStyle reservation = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    letterSpacing: 0.7,
    color: LetsGoTheme.black,
  );

  static const TextStyle search = TextStyle(
    fontSize: 14.0,
    color: LetsGoTheme.black,
  );

  static const TextStyle sliderTitle = TextStyle(
    fontSize: 20,
    color: LetsGoTheme.black,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle communityTitle = TextStyle(
    fontSize: 24,
    color: LetsGoTheme.white,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle communitySubTitle = TextStyle(
    fontSize: 14,
    color: LetsGoTheme.white,
  );

  static const TextStyle calendarMonth = TextStyle(
    fontSize: 24,
    color: Colors.amber,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle calendarDate = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle connexion = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: LetsGoTheme.main,
  );
}
