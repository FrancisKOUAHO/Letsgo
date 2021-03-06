import 'package:flutter/material.dart';

import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../widgets/home/home_slider_section.dart';
import '../../widgets/home/home_theme_section.dart';
import '../../widgets/home/user_box_title_section.dart';
import '../search/research.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LetsGoTheme.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const UserBoxTitleSection(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextField(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Research()),
                        );
                      },
                      decoration: InputDecoration(
                        fillColor: LetsGoTheme.lightPurple,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        suffixIcon: Icon(Icons.search, color: LetsGoTheme.main),
                        hintText: "Rechercher des activit?? ...",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Suggestion pour toi",
                    style: LetsGoTheme.subTitle,
                  ),
                ),
                const HomeSliderSection(),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Les activit??s",
                    style: LetsGoTheme.subTitle,
                  ),
                ),
                const HomeThemeSection(),
              ],
            ),
          )),
    );
  }
}
