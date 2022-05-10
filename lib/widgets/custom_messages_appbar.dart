import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theme/letsgo_theme.dart';

import '../views/profil/profil_screen.dart';

class CustomMessagesAppBar extends StatefulWidget {
  const CustomMessagesAppBar({Key? key}) : super(key: key);

  @override
  State<CustomMessagesAppBar> createState() => _CustomMessagesAppBarState();
}

class _CustomMessagesAppBarState extends State<CustomMessagesAppBar> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 100,
      centerTitle: true,
      title: const Text(
        'Messages',
        style: TextStyle(color: LetsGoTheme.black),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                      user!.photoURL ??
                          'https://us.123rf.com/450wm/metelsky/metelsky1809/metelsky180900220/109815466-profil-d-avatar-de-l-homme-silhouette-de-visage-masculin-ou-ic%C3%B4ne-isol%C3%A9-sur-fond-blanc-illustration-.jpg?ver=6',
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
}
