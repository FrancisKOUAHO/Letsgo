import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';
import 'package:letsgo/widgets//community/community_gallery_section.dart';
import 'package:letsgo/widgets/community/community_gallery_three_section.dart';
import 'package:letsgo/widgets/community/community_gallery_two_section.dart';
import 'package:letsgo/widgets/community/community_title_section.dart';

import '../../widgets/custom_app_bar.dart';

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
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(),
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
