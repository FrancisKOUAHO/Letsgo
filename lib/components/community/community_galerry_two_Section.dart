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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // use whichever suits your need
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Soirée du nouvel an",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.communityTitle)),
                  Text("Soirée, Drancy",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.communitySubTitle)),
                ],
              ),
            ),
            Container(
              color: LetsGoTheme.whiteTransparent,
              width: 60,
              height: 60,
              margin: EdgeInsets.fromLTRB(40, 5, 5, 95),
              child: Column(
                children: [
                  Text("DEC",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.calendarMonth)),
                  Text("31",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.calendarDate)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
