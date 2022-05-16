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
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10),
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
                      hintText: "Rechercher des activité ...",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Suggestion pour toi",
                  style: LetsGoTheme.subTitle,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const HomeSliderSection(),
              Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  "Les activités",
                  style: LetsGoTheme.subTitle,
                ),
              ),
              const HomeThemeSection(),
            ],
          ),
        ),
      ),
    );
  }
}
