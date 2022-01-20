import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityUserSection extends StatefulWidget {
  const CommunityUserSection({Key? key}) : super(key: key);

  @override
  _CommunityUserSectionState createState() => _CommunityUserSectionState();
}

class _CommunityUserSectionState extends State<CommunityUserSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                                    color: LetsGoTheme.black, fontSize: 12)),
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
    );
  }
}
