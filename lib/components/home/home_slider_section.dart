import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSliderSection extends StatefulWidget {
  const HomeSliderSection({Key? key}) : super(key: key);

  @override
  _HomeSliderSectionState createState() => _HomeSliderSectionState();
}

class _HomeSliderSectionState extends State<HomeSliderSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 254,
                    width: 209,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: new DecorationImage(
                        image: new AssetImage(
                            "assets/ressources/male-motivation-muscular.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.fromLTRB(80, 5, 5, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: LetsGoTheme.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  leading: Icon(
                                    Icons.fitness_center_rounded,
                                    size: 25,
                                    color: LetsGoTheme.white,
                                  ),
                                  title: Text('Sport',
                                      style: TextStyle(
                                          color: LetsGoTheme.white,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: LetsGoTheme.whiteTransparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  title: Text('3 séances de sport',
                                      style: TextStyle(
                                          color: LetsGoTheme.black,
                                          fontSize: 16)),
                                ),
                                const ListTile(
                                  leading: Icon(
                                    Icons.location_on_rounded,
                                    size: 25,
                                    color: LetsGoTheme.lightGrey,
                                  ),
                                  title: Text('45 avenu paris 92010',
                                      style: TextStyle(
                                          color: LetsGoTheme.lightGrey,
                                          fontSize: 14)),
                                ),
                                ButtonBar(children: [
                                  FlatButton(
                                    color: LetsGoTheme.whiteTransparent,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(9.0)),
                                    child: Text("Voir plus",
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 14)),
                                    onPressed: () {},
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 254,
                    width: 209,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: new DecorationImage(
                        image: new AssetImage(
                            "assets/ressources/juteux-boeuf.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.fromLTRB(80, 5, 5, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: LetsGoTheme.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  leading: Icon(
                                    Icons.fitness_center_rounded,
                                    size: 25,
                                    color: LetsGoTheme.white,
                                  ),
                                  title: Text('Sport',
                                      style: TextStyle(
                                          color: LetsGoTheme.white,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: LetsGoTheme.whiteTransparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  title: Text('3 séances de sport',
                                      style: TextStyle(
                                          color: LetsGoTheme.black,
                                          fontSize: 16)),
                                ),
                                const ListTile(
                                  leading: Icon(
                                    Icons.location_on_rounded,
                                    size: 25,
                                    color: LetsGoTheme.lightGrey,
                                  ),
                                  title: Text('45 avenu paris 92010',
                                      style: TextStyle(
                                          color: LetsGoTheme.lightGrey,
                                          fontSize: 14)),
                                ),
                                ButtonBar(children: [
                                  FlatButton(
                                    color: LetsGoTheme.whiteTransparent,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(9.0)),
                                    child: Text("Voir plus",
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 14)),
                                    onPressed: () {},
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 254,
                    width: 209,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: new DecorationImage(
                        image: new AssetImage(
                            "assets/ressources/male-motivation-muscular.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.fromLTRB(80, 5, 5, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: LetsGoTheme.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  leading: Icon(
                                    Icons.fitness_center_rounded,
                                    size: 25,
                                    color: LetsGoTheme.white,
                                  ),
                                  title: Text('Sport',
                                      style: TextStyle(
                                          color: LetsGoTheme.white,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: LetsGoTheme.whiteTransparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  title: Text('3 séances de sport',
                                      style: TextStyle(
                                          color: LetsGoTheme.black,
                                          fontSize: 16)),
                                ),
                                const ListTile(
                                  leading: Icon(
                                    Icons.location_on_rounded,
                                    size: 25,
                                    color: LetsGoTheme.lightGrey,
                                  ),
                                  title: Text('45 avenu paris 92010',
                                      style: TextStyle(
                                          color: LetsGoTheme.lightGrey,
                                          fontSize: 14)),
                                ),
                                ButtonBar(children: [
                                  FlatButton(
                                    color: LetsGoTheme.whiteTransparent,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(9.0)),
                                    child: Text("Voir plus",
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 14)),
                                    onPressed: () {},
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
