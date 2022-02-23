import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final double profilHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 50,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  flex: 1,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(0, 0, 100, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: LetsGoTheme.lightPurple,
                    child: ListTile(
                      leading: Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: LetsGoTheme.lightPurple,
                    child: ListTile(
                      leading: Icon(Icons.settings_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            child: CircleAvatar(
              radius: profilHeight / 2,
              backgroundColor: Colors.grey.shade800,
              backgroundImage: const AssetImage('assets/profil/mask.png'),
            ),
          ),
          Positioned(
            top: 270,
            child: nomProfile(),
          ),
          Positioned(
            top: 300,
            child: villeProfile(),
          ),
          Positioned(
            top: 350,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildButton(context, '12', 'Participation'),
                buildDivider(),
                buildButton(context, '7', 'Coups de coeur'),
              ],
            ),
          ),
          Positioned(
            top: 450,
            width: 350,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  buildCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(
          color: Colors.black,
          width: 50,
        ),
      );
}

Widget buildButton(BuildContext context, String value, String text) =>
    MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

Card buildCard() {
  var cardImage =
      const NetworkImage('https://source.unsplash.com/random/800x600?house');
  var supportingText =
      'Beautiful home to rent, recently refurbished with modern appliances...';
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          SizedBox(
            height: 200.0,
            child: Ink.image(
              image: cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("Yoga"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("13 rue de paris, 93000 montreuil"),
              Text("Cours de yoga avec Francis, prof de yoga reputer"),
            ],
          ),
        ],
      ));
}

Widget card1() {
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.network(
      'https://resize.prod.docfr.doc-media.fr/rcrop/1200,902,center-middle/img/var/doctissimo/storage/images/fr/www/forme/fitness/conseils-de-remise-en-forme/gym-exos-base/62935-3-fre-FR/gym-exos-base.jpg',
      fit: BoxFit.fill,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    elevation: 5,
    margin: const EdgeInsets.all(10),
  );
}

Widget card2() {
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Image.network(
      'https://assets.afcdn.com/story/20171016/1128498_w1200h630c1cx1060cy707.jpg',
      fit: BoxFit.fill,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    elevation: 5,
    margin: const EdgeInsets.all(10),
  );
}

Widget nomProfile() {
  return Container(
    alignment: Alignment.center,
    child: const Text(
      'Marina Dubois',
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

Widget villeProfile() {
  return Container(
    alignment: Alignment.center,
    child: const Text(
      'Paris, France',
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 15,
        color: Colors.black,
      ),
    ),
  );
}
