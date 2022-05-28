import 'package:LetsGo/views/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/auth_service.dart';
import '../../theme/letsgo_theme.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

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
                              height: 100,
                              child: Center(
                                child: Text(
                                  "Recevez un courriel pour réinitialiser votre mot de passe",
                                  style: LetsGoTheme.resetPasswordTitle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: emailController,
                              cursorColor: LetsGoTheme.white,
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
                                hintText: 'Mot de passe',
                                disabledBorder: null,
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5),
                                prefixIcon:  Icon(Icons.email_outlined,
                                    color: LetsGoTheme.white),
                                hintStyle:  TextStyle(
                                  color: LetsGoTheme.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Late',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
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
                                    'Valider',
                                    style: TextStyle(
                                      fontFamily: 'Late',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: LetsGoTheme.main,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await _auth
                                        .resetPassword(emailController.text);
                                    Fluttertoast.showToast(
                                        msg: "message envoyé",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
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
                              height: 20,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 90, right: 90),
                              child:  Divider(
                                color: LetsGoTheme.white,
                              ),
                            ),
                            InkWell(
                              child:  Text(
                                'Retour',
                                style: TextStyle(
                                  fontFamily: 'PT-Sans',
                                  fontSize: 16,
                                  color: LetsGoTheme.white,
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
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 150,
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
