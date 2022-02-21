import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class HomeThemeSection extends StatelessWidget {
  const HomeThemeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/ressources/jumelles-loup.png",
                width: 80,
                height: 80,
              ),
              title: const Text('Aventurier'),
              subtitle: const Text('Fait resortir l’aventurier en toi'),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: LetsGoTheme.main,
                size: 40,
              ),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/ressources/plage.png",
                width: 80,
                height: 80,
              ),
              title: const Text('Aventurier'),
              subtitle: const Text('Fait resortir l’aventurier en toi'),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: LetsGoTheme.main,
                size: 40,
              ),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/ressources/jumelles-loup.png",
                width: 80,
                height: 80,
              ),
              title: const Text('Aventurier'),
              subtitle: const Text('Fait resortir l’aventurier en toi'),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: LetsGoTheme.main,
                size: 40,
              ),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }
}
