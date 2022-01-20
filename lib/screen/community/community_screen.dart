import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:letsgo/components/community/community_user_section.dart';
import 'package:letsgo/components/community/community_title_section.dart';
import 'package:letsgo/components/community/community_gallery_section.dart';
import 'package:letsgo/components/community/community_galerry_two_Section.dart';
import 'package:letsgo/components/community/community_gallery_three_section.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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

//TODO FAIRE LA PETIT CARD DANS LA CARD AU MILIEU
