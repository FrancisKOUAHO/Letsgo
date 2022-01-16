import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

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

                style: GoogleFonts.lato(textStyle: LetsGoTheme.search) ,
                decoration: InputDecoration(
                  fillColor: LetsGoTheme.lightPurple, filled: true,
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
          flex: 1,
          child: Container(
            color: Colors.pink,
            child: Text('Bottom', textAlign: TextAlign.center),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.deepPurpleAccent,
            child: Text('Bottom', textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
