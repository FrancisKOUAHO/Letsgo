import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class UserBoxSection extends StatefulWidget {
  const UserBoxSection({Key? key}) : super(key: key);

  @override
  _UserBoxSectionState createState() => _UserBoxSectionState();
}

class _UserBoxSectionState extends State<UserBoxSection> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: LetsGoTheme.lightPurple,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_on_rounded,
                            size: 25, color: LetsGoTheme.main),
                        title: Text('Saint-Ouen, France',
                            style: TextStyle(
                                color: LetsGoTheme.black, fontSize: 11)),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 85),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${user!.photoURL}"),
                      radius: 30,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilScreen()),
                      );
                    },
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
