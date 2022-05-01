import 'package:flutter/material.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/home/home_slider_section.dart';
import '../../widgets/home/home_subtitle_section.dart';
import '../../widgets/home/home_theme_section.dart';
import '../../widgets/home/user_box_title_section.dart';

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
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const UserBoxTitleSection(),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Suggestion pour toi",
                  style: LetsGoTheme.subTitle,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const HomeSliderSection(),
              const SizedBox(
                height: 20,
              ),
              const HomeSubTitleSection(),
              const HomeThemeSection(),
            ],
          ),
        ),
      ),
    );
  }
}
