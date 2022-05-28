import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme/letsgo_theme.dart';
import 'create_group.dart';

class AddMembersInGroup extends StatefulWidget {
  const AddMembersInGroup({Key? key}) : super(key: key);

  @override
  State<AddMembersInGroup> createState() => _AddMembersInGroupState();
}

class _AddMembersInGroupState extends State<AddMembersInGroup> {
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> membersList = [];
  bool isLoading = false;
  Map<String, dynamic>? userMap;

  @override
  void initState() {
    super.initState();
    getCurrentUserDetails();
  }

  void getCurrentUserDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((map) {
      setState(() {
        membersList.add({
          "displayName": map['displayName'],
          "email": map['email'],
          "uid": map['uid'],
          "isAdmin": true,
        });
      });
    });
  }

  void onSearch() async {
    setState(() {
      isLoading = true;
    });

    await FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      if (kDebugMode) {
        print(userMap);
      }
    });
  }

  void onResultTap() {
    bool isAlreadyExist = false;

    for (int i = 0; i < membersList.length; i++) {
      if (membersList[i]['uid'] == userMap!['uid']) {
        isAlreadyExist = true;
      }
    }

    if (!isAlreadyExist) {
      setState(() {
        membersList.add({
          "displayName": userMap!['displayName'],
          "email": userMap!['email'],
          "uid": userMap!['uid'],
          "isAdmin": false,
        });

        userMap = null;
      });
    }
  }

  void onRemoveMembers(int index) {
    if (membersList[index]['uid'] != _auth.currentUser!.uid) {
      setState(() {
        membersList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    child: Text("",
                        style: TextStyle(
                            color: LetsGoTheme.main,
                            fontWeight: FontWeight.bold))),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(18, 0, 0, 5),
                    //apply padding to all four sides
                    child: Text(
                      "Creer un groupe",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                ),
                membersList.length >= 2
                    ? InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return CreateGroup(
                                membersList: membersList,
                              );
                            },
                          );
                        },
                        child: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: 17,
                          color: LetsGoTheme.main,
                        ))
                    : const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: 17,
                      )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ListView.builder(
              itemCount: membersList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => onRemoveMembers(index),
                  leading: const Icon(Icons.account_circle, size: 50),
                  title: Text(membersList[index]['displayName']),
                  subtitle: Text(membersList[index]['email']),
                  trailing: const Icon(Icons.close),
                );
              },
            ),
          ),
          Container(
            height: size.height / 18,
            width: size.width,
            alignment: Alignment.center,
            child: SizedBox(
              height: size.height / 14,
              width: size.width / 1.15,
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  hintText: "Rechercher un utilisateur",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 80,
          ),
          isLoading
              ? Container(
                  height: size.height / 12,
                  width: size.height / 12,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: LetsGoTheme.main,
                  ),
                  onPressed: onSearch,
                  child: const Text("Recherche"),
                ),
          userMap != null
              ? ListTile(
                  onTap: onResultTap,
                  leading: const Icon(Icons.account_box),
                  title: Text(userMap!['displayName']),
                  subtitle: Text(userMap!['email']),
                  trailing: const Icon(Icons.add),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
