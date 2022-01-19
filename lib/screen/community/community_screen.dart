import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:letsgo/screen/community/gridListCommunity.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Container(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: LetsGoTheme.lightPurple,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const ListTile(
                                leading: Icon(Icons.location_on_rounded,
                                    size: 25, color: LetsGoTheme.main),
                                title: Text('Saint-Ouen, France',
                                    style: TextStyle(
                                        color: LetsGoTheme.black,
                                        fontSize: 12)),
                              ),
                            ],
                          ))),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 85),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          "assets/profil/mask.png",
                          width: 48,
                          height: 54,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 5),
            child: Text('Community',
                style: GoogleFonts.lato(textStyle: LetsGoTheme.Title)),
          ),
        ),
        Expanded(
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
        ),
        Expanded(
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
                    style: GoogleFonts.lato(
                        textStyle: LetsGoTheme.communityTitle)),
                Text("Soirée, Drancy",
                    style: GoogleFonts.lato(
                        textStyle: LetsGoTheme.communitySubTitle)),
              ],
            ),
          ),
        ),
        Expanded(
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
        ),
      ],
    );
  }
}
