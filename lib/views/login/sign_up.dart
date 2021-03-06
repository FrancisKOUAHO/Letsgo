import 'package:LetsGo/views/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/auth_service.dart';
import '../../theme/letsgo_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController namelController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                                  "S'enregistrer",
                                  style: LetsGoTheme.loginTitle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: namelController,
                              cursorColor: Colors.white,
                              cursorWidth: 2,
                              obscureText: false,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                focusColor: LetsGoTheme.main,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
                                ),
                                hintText: 'Prenom NOM',
                                disabledBorder: null,
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5),
                                prefixIcon: const Icon(
                                    Icons.supervisor_account_outlined,
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
                            TextField(
                              controller: emailController,
                              cursorColor: Colors.white,
                              cursorWidth: 2,
                              obscureText: false,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                focusColor: LetsGoTheme.main,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
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
                            TextField(
                              controller: passwordController,
                              cursorColor: Colors.white,
                              cursorWidth: 2,
                              obscuringCharacter: "*",
                              obscureText: false,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                focusColor: LetsGoTheme.main,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: LetsGoTheme.white),
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
                            const SizedBox(
                              height: 30,
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
                                  child: Text(
                                    "S'enregistrer",
                                    style: TextStyle(
                                      fontFamily: 'Late',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: LetsGoTheme.main,
                                    ),
                                  ),
                                  onPressed: () {
                                    dynamic result =
                                        _auth.createUserWithEmailAndPassword(
                                            namelController.text,
                                            emailController.text,
                                            passwordController.text);
                                    if (result == null) {
                                      Fluttertoast.showToast(
                                          msg: "Warning",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      namelController.clear();
                                      emailController.clear();
                                      passwordController.clear();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn()),
                                      );
                                    }
                                  }),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: const Text(
                                    'Vous avez d??j?? un compte, identifiez-vous',
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
                                          builder: (context) => const SignIn()),
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
                              height: 100,
                            ),
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
}
