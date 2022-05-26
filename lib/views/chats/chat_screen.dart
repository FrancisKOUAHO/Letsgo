import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_messages_appbar.dart';

import '../../widgets/not_available_yet.dart';
import '../../widgets/notification_badge.dart';
import 'chat_room.dart';
import 'group_chat_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  Map<String, dynamic>? userMap;
  Map<String, dynamic>? friendList;
  bool isLoading = false;
  bool display = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic data;
  final TextEditingController _search = TextEditingController();
  late int _totalNotifications;
  late TabController tabController;

  @override
  void initState() {
    _totalNotifications = 2;
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
    getAvailableChats();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
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

  void getAvailableChats() async {
    setState(() {
      isLoading = true;
    });

    await FirebaseFirestore.instance
        .collection('users')
        .where("name")
        .get()
        .then((value) {
      setState(() {
        friendList = value.docs[0].data();
        isLoading = false;
      });
      if (kDebugMode) {
        print("userMap ${friendList}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      data = value;
    });

    return Scaffold(
      backgroundColor: LetsGoTheme.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomMessagesAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: LetsGoTheme.black,
                          labelColor: LetsGoTheme.white,
                          indicatorColor: LetsGoTheme.main,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: LetsGoTheme.main,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: 'Chats',
                            ),
                            Tab(
                              text: 'Groupes',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      display
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            showModalBottomSheet<void>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Column(
                                                  children: [
                                                    SizedBox(
                                                      height: size.height / 20,
                                                    ),
                                                    Container(
                                                      height: size.height / 14,
                                                      width: size.width,
                                                      alignment:
                                                          Alignment.center,
                                                      child: SizedBox(
                                                        height:
                                                            size.height / 14,
                                                        width:
                                                            size.width / 1.15,
                                                        child: TextField(
                                                          controller: _search,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Recherche",
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: size.height / 50,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: onSearch,
                                                      child: const Text(
                                                          "Recherche"),
                                                    ),
                                                    SizedBox(
                                                      height: size.height / 30,
                                                    ),
                                                    userMap != null
                                                        ? SizedBox(
                                                            height:
                                                                size.height / 2,
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              shrinkWrap: true,
                                                              itemCount:
                                                                  friendList
                                                                      ?.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Container(
                                                                    margin: const EdgeInsets
                                                                            .only(
                                                                        top: 20,
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            20),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          null,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          const CircleAvatar(
                                                                            radius:
                                                                                28,
                                                                            backgroundImage:
                                                                                NetworkImage('https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_960_720.png'),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                friendList?[index]['name'],
                                                                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              _totalNotifications == 0
                                                                                  ? NotificationBadge(totalNotifications: _totalNotifications, icon: null)
                                                                                  : CircleAvatar(
                                                                                      radius: 8,
                                                                                      backgroundColor: Colors.red,
                                                                                      child: Text(
                                                                                        _totalNotifications.toString(),
                                                                                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
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
                                                        : Container(),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child:  Text("Nouveau message",
                                              style: TextStyle(
                                                  color: LetsGoTheme.main,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: userMap != null
                                          ? Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              color: Colors.white,
                                              width: size.width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 40,
                                                    backgroundColor:
                                                        userMap!['status'] ==
                                                                'Online'
                                                            ? LetsGoTheme.green
                                                            : LetsGoTheme.red,
                                                    child: const CircleAvatar(
                                                      radius: 35,
                                                      backgroundImage: NetworkImage(
                                                          "https://s3.o7planning.com/images/boy-128.png"),
                                                    ),
                                                  ),
                                                  Text(
                                                    userMap!['displayName'],
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                userMap != null
                                    ? Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            String roomId = chatRoomId(
                                                data.data()!['displayName'],
                                                userMap!['displayName']);
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => ChatRoom(
                                                  chatRoomId: roomId,
                                                  userMap: userMap!,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    userMap!['displayName'],
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text(
                                                    'Ca va Francis ? ',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  _totalNotifications == 0
                                                      ? NotificationBadge(
                                                          totalNotifications:
                                                              _totalNotifications,
                                                          icon: null)
                                                      : CircleAvatar(
                                                          radius: 8,
                                                          backgroundColor:
                                                              Colors.red,
                                                          child: Text(
                                                            _totalNotifications
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    '05:20',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ))
                                    : Container(),
                              ],
                            )
                          : const NotAvailableYet(),
                      const GroupChatHomeScreen(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
