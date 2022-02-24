import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

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
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(8),
      width: 155,
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.srcOver),
          image: const AssetImage(
              "assets/ressources/male-motivation-muscular.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Soirée du nouvel an"),
              Text("Soirée, Drancy"),
            ],
          ),
          Container(
            color: LetsGoTheme.whiteTransparent,
            width: 60,
            height: 60,
            margin: const EdgeInsets.fromLTRB(40, 5, 5, 95),
            child: Column(
              children: const [Text("DEC"), Text("31")],
            ),
          )
        ],
      ),
    );
  }
}
