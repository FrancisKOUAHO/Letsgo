import 'package:flutter/material.dart';
import 'package:letsgo/screen/chat/components/body.dart';
import 'package:letsgo/theme/constants.dart';
import 'package:letsgo/widgets/user_list_message.dart';

import '../../navigation/custom_animated_buttom_bar.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
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
                        const UserList(),
                      ],
                    ),
                  ),
                )),
          );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: const CustomAnimatedButtomBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: const Text("Chats"));
  }
}
