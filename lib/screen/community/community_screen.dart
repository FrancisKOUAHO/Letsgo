import 'package:flutter/material.dart';
import 'package:letsgo/components/community/community_gallery_two_section.dart';
import 'package:letsgo/components/community/community_gallery_section.dart';
import 'package:letsgo/components/community/community_gallery_three_section.dart';
import 'package:letsgo/components/community/community_title_section.dart';
import 'package:letsgo/components/community/community_user_section.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          CommunityUserSection(),
          CommunityTitleSection(),
          CommunityGallerySection(),
          CommunityGalleryTwoSection(),
          CommunityGalleryThreeSection(),
        ],
      ),
    ));
  }
}
