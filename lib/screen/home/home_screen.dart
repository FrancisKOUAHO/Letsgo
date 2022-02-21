import 'package:flutter/material.dart';
import 'package:letsgo/components/home/user_box_section.dart';
import 'package:letsgo/components/home/user_box_title_section.dart';
import 'package:letsgo/components/home/home_search_section.dart';
import 'package:letsgo/components/home/home_slider_section.dart';
import 'package:letsgo/components/home/home_theme_section.dart';
import 'package:letsgo/components/home/home_subtitle_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            UserBoxSection(),
            UserBoxTitleSection(),
            HomeSearchSection(),
            HomeSliderSection(),
            HomeSubTitleSection(),
            HomeThemeSection(),
          ],
        ),
      ),
    );
  }
}
