import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class SearchUserSection extends StatefulWidget {
  const SearchUserSection({Key? key}) : super(key: key);

  @override
  _SearchUserSectionState createState() => _SearchUserSectionState();
}

class _SearchUserSectionState extends State<SearchUserSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: LetsGoTheme.lightPurple,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_on_rounded,
                            size: 25, color: LetsGoTheme.main),
                        title: Text('Saint-Ouen, France',
                            style: TextStyle(
                                color: LetsGoTheme.black, fontSize: 11)),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 85),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/profil/mask.png",
                    width: 48,
                    height: 54,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
