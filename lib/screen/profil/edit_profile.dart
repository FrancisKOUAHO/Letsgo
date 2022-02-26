import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsUI extends StatelessWidget {
  const SettingsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                user!.photoURL ??
                                    'https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png',
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.deepPurple,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              buildTextField("Nom complet", user!.displayName ?? '', false),
              buildTextField("E-mail", user!.email ?? '', false),
              buildTextField("Mot de passe", "********", true),
              buildTextField("Location", '', false),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: const Text("ANNULER",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "VALIDER",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
