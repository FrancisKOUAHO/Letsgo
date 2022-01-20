import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityGallerySection extends StatefulWidget {
  const CommunityGallerySection({Key? key}) : super(key: key);

  @override
  _CommunityGallerySectionState createState() => _CommunityGallerySectionState();
}

class _CommunityGallerySectionState extends State<CommunityGallerySection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
                Text("Matéo",
                    style: GoogleFonts.lato(
                        textStyle: LetsGoTheme.communityTitle)),
                Text("Acrobranche",
                    style: GoogleFonts.lato(
                        textStyle: LetsGoTheme.communitySubTitle)),
              ],
            ),
          ),
          Container(
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
                Text("Leena",
                    style: GoogleFonts.lato(
                        textStyle: LetsGoTheme.communityTitle)),
                Text("Saut en parachute",
                    style: GoogleFonts.lato(
                        textStyle: LetsGoTheme.communitySubTitle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
