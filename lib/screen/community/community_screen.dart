import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letsgo/components/community/community_gallery_section.dart';
import 'package:letsgo/components/community/community_gallery_three_section.dart';
import 'package:letsgo/components/community/community_gallery_two_section.dart';
import 'package:letsgo/components/community/community_title_section.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
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
          IconButton(
            icon: Image.network("${user!.photoURL}"),
            tooltip: 'Show Snackbar',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              SizedBox(
                height: 40,
              ),
              CommunityTitleSection(),
              SizedBox(
                height: 40,
              ),
              CommunityGallerySection(),
              CommunityGalleryTwoSection(),
              CommunityGalleryThreeSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomAnimatedButtomBar(),

    );
  }
}
