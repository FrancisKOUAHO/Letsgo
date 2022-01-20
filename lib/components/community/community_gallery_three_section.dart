import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityGalleryThreeSection extends StatefulWidget {
  const CommunityGalleryThreeSection({Key? key}) : super(key: key);

  @override
  _CommunityGalleryThreeSectionState createState() =>
      _CommunityGalleryThreeSectionState();
}

class _CommunityGalleryThreeSectionState
    extends State<CommunityGalleryThreeSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
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
                  Text("Scoob",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.communityTitle)),
                  Text("Pique nique",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.communitySubTitle)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
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
                  Text("Dina",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.communityTitle)),
                  Text("Karaoké",
                      style: GoogleFonts.lato(
                          textStyle: LetsGoTheme.communitySubTitle)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
