import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:letsgo/navigation/custom_animated_buttom_bar.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/widgets/home/home_search_section.dart';
import 'package:letsgo/widgets/home/home_slider_section.dart';
import 'package:letsgo/widgets/home/home_subtitle_section.dart';
import 'package:letsgo/widgets/home/home_theme_section.dart';
import 'package:letsgo/widgets/home/user_box_title_section.dart';

import '../../common/resume_word.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String currentAddress = '';
  late Position currentposition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: _determinePosition,
              icon:
                  const FaIcon(FontAwesomeIcons.mapMarked, color: Colors.white),
            ),
            Text(currentAddressOk(currentAddress),
                style: const TextStyle(fontSize: 18)),
            // Your widgets here
          ],
        ),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidBell, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
          GestureDetector(
            child: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ??
                  "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const UserBoxTitleSection(),
              const SizedBox(
                height: 20,
              ),
              const HomeSearchSection(),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Suggestion pour toi",
                  style: LetsGoTheme.subTitle,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const HomeSliderSection(),
              const SizedBox(
                height: 20,
              ),
              const HomeSubTitleSection(),
              const HomeThemeSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomAnimatedButtomBar(),
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

      setState(()  {
        currentposition = position;
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";

         FirebaseFirestore.instance.collection('users').add({
          "location": currentAddress,
          "uid": _auth.currentUser!.uid,
        });
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
