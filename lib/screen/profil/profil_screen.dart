import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            top: 300,
            width: 350,
            child: card1(),
          ),
          Positioned(
            top: 250,
            child: villeProfile(),
          ),
          Positioned(
            top: 600,
            width: 350,
            child: card2(),
          ),
          Positioned(top: 220, child: nomProfile()),
          Positioned(
            top: 70,
            child: buildProfilImage(),
          ),
        ],
      ),
    );
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

  Widget buildProfilImage() => CircleAvatar(
        radius: profilHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('assets/profil/mask.png'),
      );
}
