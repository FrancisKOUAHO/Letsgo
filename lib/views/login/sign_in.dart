import 'package:LetsGo/views/login/reset_password.dart';
import 'package:LetsGo/views/login/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../services/auth_service.dart';
import '../../services/firebase_service.dart';
import '../../theme/letsgo_theme.dart';
import '../home/home_screen.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  dynamic data;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signInGoogle() async {
    FirebaseService service = FirebaseService();
    try {
      await service.signInwithGoogle();

      setState(() {
        FirebaseFirestore.instance
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .get()
            .then((value) {
          setState(() {
            data = value;
          });
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    } catch (e) {
      if (e is FirebaseAuthException) {
        showMessage(e.message!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool _validate = false;

    final AuthService _auth = AuthService();

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/SignIn.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    LetsGoTheme.fifth.withOpacity(0.5),
                    LetsGoTheme.main.withOpacity(0.5),
                    LetsGoTheme.main.withOpacity(1),
                    LetsGoTheme.main.withOpacity(1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 0.5, 1, 1],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                             SizedBox(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "S'identifier",
                                  style: LetsGoTheme.loginTitle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: emailController,
                              cursorColor: Colors.white,
                              cursorWidth: 2,
                              obscureText: false,
                              style:  TextStyle(color: LetsGoTheme.white),
                              decoration: InputDecoration(
                                focusColor: LetsGoTheme.main,
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: LetsGoTheme.white),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: LetsGoTheme.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:   BorderSide(color: LetsGoTheme.white),
                                ),
                                hintText: 'Adresse mail',
                                disabledBorder: null,
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5),
                                prefixIcon: const Icon(Icons.email_outlined,
                                    color: Colors.white),
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Late',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: passwordController,
                              cursorColor: Colors.white,
                              cursorWidth: 2,
                              obscuringCharacter: "*",
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                focusColor: LetsGoTheme.main,
                                focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: LetsGoTheme.white),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: LetsGoTheme.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:   BorderSide(color: LetsGoTheme.white),
                                ),
                                hintText: 'Mot de passe',
                                disabledBorder: null,
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5),
                                prefixIcon: const Icon(Icons.lock_outlined,
                                    color: Colors.white),
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Late',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                child: const Text(
                                  'Mot de passe oubli?? ?',
                                  style: TextStyle(
                                    fontFamily: 'Late',
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResetPassword()),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 64,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                    elevation: MaterialStateProperty.all(6),
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  child:  Text(
                                    'connexion',
                                    style: TextStyle(
                                      fontFamily: 'Late',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: LetsGoTheme.main,
                                    ),
                                  ),
                                  onPressed: ()  {
                                    dynamic authResult =
                                         _auth.signInEmailAndPassword(
                                            emailController.text,
                                            passwordController.text);
                                    if (authResult == null) {
                                      Fluttertoast.showToast(
                                          msg:
                                              'Erreur de connexion. Impossible de se connecter',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 5,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                       Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()),
                                      );
                                      emailController.clear();
                                      passwordController.clear();
                                    }
                                    setState(() {
                                      emailController.text.isEmpty
                                          ? _validate = true
                                          : _validate = false;
                                      passwordController.text.isEmpty
                                          ? _validate = true
                                          : _validate = false;
                                    });
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: const Text(
                                    "Vous n'avez pas de compte ? Enregistrez-vous",
                                    style: TextStyle(
                                      fontFamily: 'PT-Sans',
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 90, right: 90),
                              child: const Divider(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white.withOpacity(0.9),
                                  ),
                                  icon: const FaIcon(FontAwesomeIcons.google,
                                      color: Colors.red),
                                  label:  Text(
                                    "Google",
                                    style: TextStyle(
                                      fontFamily: 'Late',
                                      fontSize: 14,
                                      color: LetsGoTheme.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    signInGoogle();
                                  },
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white.withOpacity(0.9),
                                  ),
                                  icon: const FaIcon(FontAwesomeIcons.facebook,
                                      color: Colors.blue),
                                  label:  Text(
                                    "Facebook",
                                    style: TextStyle(
                                      fontFamily: 'Late',
                                      fontSize: 14,
                                      color: LetsGoTheme.black,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
