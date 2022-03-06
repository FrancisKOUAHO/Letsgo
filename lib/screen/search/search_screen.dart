import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letsgo/widgets/search/search_list_aventure.dart';
import 'package:letsgo/widgets/search/search_maps_section.dart';
import 'package:letsgo/widgets/search/search_search_section.dart';
import 'package:letsgo/widgets/search/search_title_section.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon:
                  const FaIcon(FontAwesomeIcons.mapMarked, color: Colors.white),
            ),
            const Text("Saint-Ouen, France"),
            // Your widgets here
          ],
        ),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidBell, color: Colors.white),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
          GestureDetector(
            child: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ??
                  "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
        ],
      ),
      body:SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              SizedBox(
                height: 20,
              ),
              SearchSearchSection(),
              SearchMapsSection(),
              SearchTitleSection(),
              SearchListAventure(),
            ],
          ),
        ),
      bottomNavigationBar: const CustomAnimatedButtomBar(),
    );
  }
}
