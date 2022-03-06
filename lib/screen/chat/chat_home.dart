import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/common/resume_word.dart';
import 'package:letsgo/theme/constants.dart';
import 'package:letsgo/widgets/Follow.dart';
import 'package:letsgo/widgets/user_list_message.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../navigation/custom_animated_buttom_bar.dart';
import '../../services/database.dart';
import '../../services/notification_service.dart';
import '../../widgets/filled_outline_button.dart';

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
          backgroundColor: Colors.deepPurple,
          title: const Text("Messages"),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(currentUser!.photoURL ??
                  "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                  kDefaultPadding, 20, kDefaultPadding, kDefaultPadding),
              color: kPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FillOutlineButton(press: () {}, text: "Recent Message"),
                  const SizedBox(width: kDefaultPadding),
                  FillOutlineButton(
                    press: () {},
                    text: "Active",
                    isFilled: false,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: UserList(),
            ),
          ],
        ),
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
                              child: const Text("Annuler",
                                  style: TextStyle(
                                      color: Colors.deepPurpleAccent)),
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
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    fit: StackFit.expand,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(currentUser!
                                                .photoURL ??
                                            "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
                                      ),
                                      Positioned(
                                        right: 5,
                                        bottom: 35,
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              side: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.deepPurpleAccent[100]
                                                ?.withOpacity(0.9),
                                            onPressed: () {},
                                            child: const Positioned(
                                                child: Icon(
                                              Icons.close,
                                              size: 10,
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                    sliceNameAndLastname(
                                            currentUser?.displayName) ??
                                        '',
                                    style: const TextStyle()),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Expanded(child: Follow()),
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
