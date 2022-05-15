import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';

class AddMembersINGroup extends StatefulWidget {
  final String groupChatId, displayName;
  final List membersList;

  const AddMembersINGroup(
      {required this.displayName,
      required this.membersList,
      required this.groupChatId,
      Key? key})
      : super(key: key);

  @override
  _AddMembersINGroupState createState() => _AddMembersINGroupState();
}

class _AddMembersINGroupState extends State<AddMembersINGroup> {
  final TextEditingController _search = TextEditingController();
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  List membersList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    membersList = widget.membersList;
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

  void onAddMembers() async {
    membersList.add(userMap);

    await FirebaseFirestore.instance.collection('groups').doc(widget.groupChatId).update({
      "members": membersList,
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userMap!['uid'])
        .collection('groups')
        .doc(widget.groupChatId)
        .set({"displayName": widget.displayName, "id": widget.groupChatId});
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter des membres"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              height: size.height / 14,
              width: size.width,
              alignment: Alignment.center,
              child: SizedBox(
                height: size.height / 14,
                width: size.width / 1.15,
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: "Recherche",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            isLoading
                ? Container(
                    height: size.height / 12,
                    width: size.height / 12,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: onSearch,
                    child: const Text("Recherche"),
                  ),
            userMap != null
                ? ListTile(
                    onTap: onAddMembers,
                    leading: const Icon(Icons.account_box, color: kPrimaryColor,),
                    title: Text(userMap!['displayName']),
                    subtitle: Text(userMap!['email']),
                    trailing: const Icon(Icons.add, color: kPrimaryColor,),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
