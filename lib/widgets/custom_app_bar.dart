import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:letsgo/views/search/search_map.dart';

import '../theme/letsgo_theme.dart';
import '../views/profil/profil_screen.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String currentAddress = 'Position inconnue';
  late Position currentposition;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        currentAddress = value.data()!["localization"];
      });
    });
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 100,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(14.0)),
            child: Container(
              color: LetsGoTheme.lightPurple,
              padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
              height: 45,
              child: Row(
                children: [
                  IconButton(
                    onPressed: _determinePosition,
                    icon: const FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: LetsGoTheme.main,
                    ),
                    iconSize: 20.0,
                  ),
                  Text(
                    currentAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      color: LetsGoTheme.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Your widgets here
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.solidBell,
                color: LetsGoTheme.main,
              ),
              iconSize: 20.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchMap()),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilScreen()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(
          msg: 'Veuillez activer votre service de localisation');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(
            msg: 'Les autorisations de localisation sont refusées');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              "Les autorisations de localisation sont refusées de manière permanente, nous ne pouvons pas demander d'autorisations.");
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";

        FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({'localization': currentAddress});
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
