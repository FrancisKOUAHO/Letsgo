import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_return_appbar.dart';
import 'add_members.dart';
import 'chat_screen.dart';

class GroupInfo extends StatefulWidget {
  final String groupId, groupName;

  const GroupInfo({required this.groupId, required this.groupName, Key? key})
      : super(key: key);

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  List membersList = [];
  bool isLoading = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getGroupDetails();
  }

  Future getGroupDetails() async {
    await FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .get()
        .then((chatMap) {
      membersList = chatMap['members'];
      if (kDebugMode) {
        print(membersList);
      }
      isLoading = false;
      setState(() {});
    });
  }

  bool checkAdmin() {
    bool isAdmin = false;

    for (var element in membersList) {
      if (element['uid'] == _auth.currentUser!.uid) {
        isAdmin = element['isAdmin'];
      }
    }
    return isAdmin;
  }

  Future removeMembers(int index) async {
    String uid = membersList[index]['uid'];

    setState(() {
      isLoading = true;
      membersList.removeAt(index);
    });

    await FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .update({
      "members": membersList,
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('groups')
          .doc(widget.groupId)
          .delete();

      setState(() {
        isLoading = false;
      });
    });
  }

  void showDialogBox(int index) {
    if (checkAdmin()) {
      if (_auth.currentUser!.uid != membersList[index]['uid']) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: ListTile(
                  onTap: () => removeMembers(index),
                  title: const Text("Retirer ce membre"),
                ),
              );
            });
      }
    }
  }

  Future onLeaveGroup() async {
    if (!checkAdmin()) {
      setState(() {
        isLoading = true;
      });

      for (int i = 0; i < membersList.length; i++) {
        if (membersList[i]['uid'] == _auth.currentUser!.uid) {
          membersList.removeAt(i);
        }
      }

      await FirebaseFirestore.instance
          .collection('groups')
          .doc(widget.groupId)
          .update({
        "members": membersList,
      });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('groups')
          .doc(widget.groupId)
          .delete();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const ChatScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: LetsGoTheme.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: CustomReturnAppBar('', Colors.transparent, LetsGoTheme.black),
        ),
        body: isLoading
            ? Container(
                height: size.height,
                width: size.width,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: size.height / 8,
                      width: size.width / 1.1,
                      child: Row(
                        children: [
                          Container(
                            height: size.height / 11,
                            width: size.height / 11,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: const CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  'https://s1.o7planning.com/fr/12997/images/64425712.png'),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 20,
                          ),
                          Expanded(
                            child: Text(
                              widget.groupName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: size.width / 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),

                    SizedBox(
                      width: size.width / 1.1,
                      child: Text(
                        "${membersList.length} Membres",
                        style: TextStyle(
                          fontSize: size.width / 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size.height / 20,
                    ),

                    // Members Name

                    checkAdmin()
                        ? ListTile(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => AddMembersINGroup(
                                  groupChatId: widget.groupId,
                                  displayName: widget.groupName,
                                  membersList: membersList,
                                ),
                              ),
                            ),
                            leading: const Icon(
                              Icons.add,
                            ),
                            title: Text(
                              "Ajouter des membres",
                              style: TextStyle(
                                fontSize: size.width / 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : const SizedBox(),

                    Flexible(
                      child: ListView.builder(
                        itemCount: membersList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () => showDialogBox(index),
                            leading: const CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  'https://s1.o7planning.com/fr/12997/images/64425712.png'),
                            ),
                            title: Text(
                              membersList[index]['displayName'],
                              style: TextStyle(
                                fontSize: size.width / 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(membersList[index]['email']),
                            trailing: Text(
                                membersList[index]['isAdmin'] ? "Admin" : ""),
                          );
                        },
                      ),
                    ),

                    ListTile(
                      onTap: onLeaveGroup,
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.redAccent,
                      ),
                      title: Text(
                        "Quitter le groupe",
                        style: TextStyle(
                          fontSize: size.width / 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
