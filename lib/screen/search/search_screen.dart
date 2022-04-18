import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';
import 'package:letsgo/screen/search/research.dart';
import 'package:letsgo/widgets/search/search_list_aventure.dart';
import 'package:letsgo/widgets/search/search_maps_section.dart';
import 'package:letsgo/widgets/search/search_title_section.dart';

import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  <Widget>[
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextField(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Research()),
                      );
                    },
                    decoration: InputDecoration(
                      fillColor: LetsGoTheme.lightPurple,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      suffixIcon: const Icon(Icons.search, color: LetsGoTheme.main),
                      hintText: "Rechercher des activité ...",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SearchMapsSection(),
              const SearchTitleSection(),
              const SearchListAventure(),
            ],
          ),
        )
      ),
      bottomNavigationBar: const CustomAnimatedButtomBar(),
    );
  }
}