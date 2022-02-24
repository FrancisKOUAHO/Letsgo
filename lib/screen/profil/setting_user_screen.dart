import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letsgo/screen/login/sign_in.dart';
import 'package:letsgo/screen/profil/profil_screen.dart';
import 'package:letsgo/services/auth_service.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:provider/provider.dart';

class SettingUserScrenn extends StatefulWidget {
  const SettingUserScrenn({Key? key}) : super(key: key);

  @override
  _SettingUserScrennState createState() => _SettingUserScrennState();
}

class _SettingUserScrennState extends State<SettingUserScrenn> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidBell, color: Colors.white),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.cog, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingUserScrenn()),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.deepPurple,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://s3.o7planning.com/images/boy-128.png"),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text("${user!.displayName}", style: LetsGoTheme.Title),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Paramètre du compte",
                  style: LetsGoTheme.subTitle,
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.solidUser,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Information personnelles")
                  ],
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.solidBell,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Notifications")
                  ],
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.solidCalendarCheck,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Confidentialité et partage")
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Assistance",
                  style: LetsGoTheme.subTitle,
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.question,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Fonctionnement de Let’s GO")
                  ],
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.handsHelping,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Obtenir de l’aide")
                  ],
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.solidStickyNote,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Vos remarques")
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Juridique",
                  style: LetsGoTheme.subTitle,
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.bookOpen,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Conditions de services ")
                  ],
                ),
                Row(
                  children: const [
                    IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(FontAwesomeIcons.bookOpen,
                            color: Colors.deepPurple),
                        onPressed: null),
                    Text("Politique de confidentialité")
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await authService.signOut().then((result) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()))
                        });
                  },
                  child: const Text("Se déconnecté"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
