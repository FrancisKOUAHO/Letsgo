import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchListAventure extends StatefulWidget {
  const SearchListAventure({Key? key}) : super(key: key);

  @override
  _SearchListAventureState createState() => _SearchListAventureState();
}

class _SearchListAventureState extends State<SearchListAventure> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10),
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
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: LetsGoTheme.main,
                  size: 50,
                ),
                isThreeLine: true,
              ),
            ),
            Card(
              child: ListTile(
                leading: new Image.asset(
                  "assets/ressources/massage.png",
                  width: 80,
                  height: 80,
                ),
                title: Text('Aventurier'),
                subtitle: Text('Fait resortir l’aventurier en toi'),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: LetsGoTheme.main,
                  size: 50,
                ),
                isThreeLine: true,
              ),
            ),
            Card(
              child: ListTile(
                leading: new Image.asset(
                  "assets/ressources/sport.png",
                  width: 80,
                  height: 80,
                ),
                title: Text('Aventurier'),
                subtitle: Text('Fait resortir l’aventurier en toi'),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: LetsGoTheme.main,
                  size: 50,
                ),
                isThreeLine: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}