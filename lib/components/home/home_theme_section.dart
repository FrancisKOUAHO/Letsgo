import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeThemeSection extends StatelessWidget {
  const HomeThemeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: LetsGoTheme.main,
                  size: 40,
                ),
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
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: LetsGoTheme.main,
                  size: 40,
                ),
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
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: LetsGoTheme.main,
                  size: 40,
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
