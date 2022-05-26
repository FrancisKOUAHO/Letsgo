import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/views/profil/edit_profile.dart';
import 'package:letsgo/services/auth_service.dart';
import '../../widgets/custom_app_bar/custom_return_appbar.dart';

import '../login/sign_in.dart';

class SettingsScren extends StatefulWidget {
  const SettingsScren({Key? key}) : super(key: key);

  @override
  _SettingsScrenState createState() => _SettingsScrenState();
}

class _SettingsScrenState extends State<SettingsScren> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LetsGoTheme.white,
      appBar:   PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomReturnAppBar('Paramètres', Colors.transparent, LetsGoTheme.black ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children:  [
                Icon(
                  Icons.person,
                  color: LetsGoTheme.main,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Compte",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Paramètres du compte"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Langue"),
            buildAccountOptionRow(context, "Vie privée et sécurité"),
            const SizedBox(
              height: 40,
            ),
            Row(
              children:  [
                Icon(
                  Icons.volume_up_outlined,
                  color: LetsGoTheme.main,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("Nouveau pour vous", true),
            buildNotificationOptionRow("Activité du compte", true),
            buildNotificationOptionRow("Opportunité", false),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  side:  BorderSide(
                    width: 2,
                    color: LetsGoTheme.main,
                  ),
                ),
                onPressed: () async {
                  await _auth.signOut().then((result) => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignIn()),
                    )
                  });
                },
                child: const Text("Se déconnecter",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditProfilePage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
