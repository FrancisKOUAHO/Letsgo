import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Scoob"),
                  Text("Pique nique")
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Dina"),
                  Text("Karaoké"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
