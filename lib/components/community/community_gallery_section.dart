import 'package:flutter/material.dart';

class CommunityGallerySection extends StatefulWidget {
  const CommunityGallerySection({Key? key}) : super(key: key);

  @override
  _CommunityGallerySectionState createState() =>
      _CommunityGallerySectionState();
}

class _CommunityGallerySectionState extends State<CommunityGallerySection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Matéo"),
              Text("Acrobranche"),
            ],
          ),
        ),
        Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Leena"),
              Text("Saut en parachute"),
            ],
          ),
        ),
      ],
    );
  }
}
