import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

import 'package:letsgo/widgets/community/community_gallery_card.dart';

import '../../widgets/custom_app_bar/custom_app_bar.dart';

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
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: GridView(
              children: [
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            )),
      ),
    );
  }
}
