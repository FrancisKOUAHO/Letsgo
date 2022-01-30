import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:letsgo/screen/login/sign_in.dart';
import 'package:letsgo/services/auth_service.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isChecked = false;
  var name, email, password, token;

  Widget _buildTextField({
    required bool obscureText,
    Widget? prefixedIcon,
    String? hintText,
    onChange,
  }) {
    return Material(
      color: Colors.transparent,
      child: TextField(
        onChanged: onChange,
        cursorColor: Colors.white,
        cursorWidth: 2,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: null,
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          prefixIcon: prefixedIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Late',
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text(
          'Mot de passe oublié ?',
          style: TextStyle(
            fontFamily: 'Late',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildsignUpButton() {
    return SizedBox(
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
          child: const Text(
            "S'inscrire",
            style: TextStyle(
              fontFamily: 'Late',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: LetsGoTheme.main,
            ),
          ),
          onPressed: () {
            AuthService().signUp(name, email, password).then((value) {
              Fluttertoast.showToast(
                  msg: "L'inscription validé",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP_RIGHT,
                  backgroundColor: Colors.green,
                  fontSize: 16.0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
              );
            });
          }),
    );
  }

  Widget _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: const Text(
            'Vous avez déja un compte ?',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextField(
                                hintText: 'Prénom',
                                obscureText: false,
                                prefixedIcon: const Icon(
                                    Icons.supervised_user_circle_outlined,
                                    color: Colors.white),
                                onChange: (value) {
                                  name = value;
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            _buildTextField(
                                hintText: 'Email',
                                obscureText: false,
                                prefixedIcon: const Icon(Icons.email_outlined,
                                    color: Colors.white),
                                onChange: (value) {
                                  email = value;
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTextField(
                                hintText: 'Mot de passe',
                                obscureText: true,
                                prefixedIcon: const Icon(Icons.lock_outlined,
                                    color: Colors.white),
                                onChange: (value) {
                                  password = value;
                                }),
                            const SizedBox(
                              height: 15,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _buildsignUpButton(),
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
                            _buildSignUpQuestion(),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 90, right: 90),
                              child: const Divider(
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              child: const Text(
                                'Passer',
                                style: TextStyle(
                                  fontFamily: 'PT-Sans',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {},
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
