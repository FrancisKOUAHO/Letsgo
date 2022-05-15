import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/views/chats/create_group/add_members.dart';
import 'package:letsgo/views/chats/group_chat_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/widgets/notification_badge.dart';

class GroupChatHomeScreen extends StatefulWidget {
  const GroupChatHomeScreen({Key? key}) : super(key: key);

  @override
  _GroupChatHomeScreenState createState() => _GroupChatHomeScreenState();
}

class _GroupChatHomeScreenState extends State<GroupChatHomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late int _totalNotifications;
  bool isLoading = true;

  List groupList = [];

  @override
  void initState() {
    _totalNotifications = 2;
    getAvailableGroups();
    super.initState();
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('groups')
        .get()
        .then((value) {
      setState(() {
        groupList = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddMembersInGroup();
                      },
                    );
                  },
                  child: const Text("Creer un groupe",
                      style: TextStyle(
                          color: LetsGoTheme.main,
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        SizedBox(
          height: size.height / 2,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: groupList.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => GroupChatRoom(
                          groupName: groupList[index]['name'],
                          groupChatId: groupList[index]['id'],
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_960_720.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              groupList[index]['name'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Ca va Francis ? ',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _totalNotifications == 0
                                ? NotificationBadge(
                                    totalNotifications: _totalNotifications,
                                    icon: null)
                                : CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      _totalNotifications.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '05:20',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ));
            },
          ),
        )
      ],
    );
  }
}
