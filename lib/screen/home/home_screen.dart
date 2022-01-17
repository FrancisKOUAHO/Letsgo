import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
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
                                leading:
                                    Icon(Icons.location_on_rounded, size: 25),
                                title: Text('Saint-Ouen, France',
                                    style: TextStyle(
                                        color: LetsGoTheme.black,
                                        fontSize: 11)),
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
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Let's GO,",
                    style: GoogleFonts.lato(textStyle: LetsGoTheme.bigTitle)),
                Text("Marina!",
                    style: GoogleFonts.lato(textStyle: LetsGoTheme.bigTitle))
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: GoogleFonts.lato(textStyle: LetsGoTheme.search),
                decoration: InputDecoration(
                  fillColor: LetsGoTheme.lightPurple,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  suffixIcon: Icon(Icons.search, color: LetsGoTheme.third),
                  hintText: "Rechercher des activité ...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: new Image.asset(
                      "assets/ressources/jumelles-loup.png",
                      width: 80,
                      height: 80,
                    ),
                    title: Text('Aventurier'),
                    subtitle: Text('Fait resortir l’aventurier en toi'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: new Image.asset(
                      "assets/ressources/plage.png",
                      width: 80,
                      height: 80,
                    ),
                    title: Text('Aventurier'),
                    subtitle: Text('Fait resortir l’aventurier en toi'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    isThreeLine: true,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: new Image.asset(
                      "assets/ressources/jumelles-loup.png",
                      width: 80,
                      height: 80,
                    ),
                    title: Text('Aventurier'),
                    subtitle: Text('Fait resortir l’aventurier en toi'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    isThreeLine: true,
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
