import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:letsgo/services/auth_service.dart';
import 'package:letsgo/theme/constants.dart';
import 'package:letsgo/widgets/user_list_message.dart';
import 'package:provider/provider.dart';

import '../../common/resume_word.dart';
import '../../models/user_model.dart';
import '../../navigation/custom_animated_buttom_bar.dart';
import '../../services/database.dart';
import '../../services/notification_service.dart';
import '../profil/profil_screen.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    NotificationService.initialize();
    final user = Provider.of<AppUser?>(context);
    if (user == null) throw Exception("user not found");
    final database = DatabaseService(user.uid);
    return StreamProvider<List<UserData>>.value(
      initialData: const [],
      value: database.users,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(currentUser!.photoURL ?? "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(sliceNameAndLastname(currentUser!.displayName ?? ''), style:  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                       const Text("En ligne",  style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 10))
                    ],
                  ),
                ],
              ),
              // Your widgets here
            ],
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: const UserList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: 800,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text("Annuler"),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text("Nouveau groupe"),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text("Créer"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nom du groupe',
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.person_add_alt_1,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: const CustomAnimatedButtomBar(),
      ),
    );
  }
}
