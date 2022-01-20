import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityGalleryTwoSection extends StatefulWidget {
  const CommunityGalleryTwoSection({Key? key}) : super(key: key);

  @override
  _CommunityGalleryTwoSectionState createState() =>
      _CommunityGalleryTwoSectionState();
}

class _CommunityGalleryTwoSectionState
    extends State<CommunityGalleryTwoSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.all(8),
        width: 155,
        height: 165,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: new DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.srcOver),
            image: new AssetImage(
                "assets/ressources/male-motivation-muscular.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Soirée du nouvel an",
                style: GoogleFonts.lato(textStyle: LetsGoTheme.communityTitle)),
            Text("Soirée, Drancy",
                style:
                    GoogleFonts.lato(textStyle: LetsGoTheme.communitySubTitle)),
          ],
        ),
      ),
    );
  }
}
