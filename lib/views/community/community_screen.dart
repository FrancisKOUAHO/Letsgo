import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/community/community_gallery_card.dart';
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
            padding: const EdgeInsets.all(20),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: const [
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
                CommunityGalleryCard(),
              ],
            )),
      ),
    );
  }
}
