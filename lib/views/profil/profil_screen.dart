import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/custom_app_bar/custom_profil_appbar.dart';
import 'package:letsgo/views/booking/list_booking.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  dynamic user;
  final double profilHeight = 144;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final FirebaseAuth _auth = FirebaseAuth.instance;

    FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        user = value;
      });
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomProfilAppBar(),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.network(
              user.data()['photoUrl'] ??
                  'https://www.solutionmotsfleches.com/images/avatar.jpg',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 480,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      bottom: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                user.data()['photoUrl'] ??
                                    'https://www.solutionmotsfleches.com/images/avatar.jpg',
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  user.data()!['displayName'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    height: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: null,
                          child: SizedBox(
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.accusoft,
                                    size: 16, color: LetsGoTheme.main),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "ACTIVITÈS",
                                  style: TextStyle(
                                    color: LetsGoTheme.black,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "01",
                                  style: TextStyle(
                                    color: LetsGoTheme.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListBooking()),
                            );
                          },
                          child: SizedBox(
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.ticket,
                                    size: 16, color: LetsGoTheme.main),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "RESERVATION",
                                  style: TextStyle(
                                    color: LetsGoTheme.black,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "17",
                                  style: TextStyle(
                                    color: LetsGoTheme.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: SizedBox(
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.heartPulse,
                                    size: 16, color: LetsGoTheme.main),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "COUPS DE COEUR",
                                  style: TextStyle(
                                    color: LetsGoTheme.black,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "7",
                                  style: TextStyle(
                                    color: LetsGoTheme.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  const Text(
                    "Amis",
                    style: TextStyle(
                      color: LetsGoTheme.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 56,
                              width: 56,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/friends_" +
                                        index.toString() +
                                        ".jpg"),
                                  )));
                        }),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Photos",
                    style: TextStyle(
                      color: LetsGoTheme.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 160,
                              width: 110,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/photo_" +
                                        index.toString() +
                                        ".jpg"),
                                  )));
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
