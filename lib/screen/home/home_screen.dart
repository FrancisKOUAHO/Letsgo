import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letsgo/widgets/home/home_search_section.dart';
import 'package:letsgo/widgets/home/home_slider_section.dart';
import 'package:letsgo/widgets/home/home_subtitle_section.dart';
import 'package:letsgo/widgets/home/home_theme_section.dart';
import 'package:letsgo/widgets/home/user_box_title_section.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            IconButton(
              onPressed: null,
              icon:
                  FaIcon(FontAwesomeIcons.mapMarked, color: Colors.white),
            ),
            Text("Saint-Ouen, France"),
            // Your widgets here
          ],
        ),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidBell, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
          IconButton(
            icon: Image.network(user!.photoURL ??
                "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
              const HomeSearchSection(),
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
      bottomNavigationBar: const CustomAnimatedButtomBar(),
    );
  }
}
