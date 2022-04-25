import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/letsgo_theme.dart';
import '../profil/profil_screen.dart';

class Research extends StatefulWidget {
  const Research({Key? key}) : super(key: key);

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const FaIcon(FontAwesomeIcons.mapMarked,
                    color: Colors.white),
              ),
              const Text("Saint-Ouen, France"),
              // Your widgets here
            ],
          ),
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            IconButton(
              icon:
                  const FaIcon(FontAwesomeIcons.solidBell, color: Colors.white),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilScreen()),
                );
              },
            ),
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL ??
                    "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilScreen()),
                );
              },
            ),
          ],
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val) => {initiateSearch(val)},
              decoration: InputDecoration(
                fillColor: LetsGoTheme.lightPurple,
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                prefixIcon: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search,
                      size: 16, color: LetsGoTheme.main),
                  onPressed: _onPressed,
                ),
                hintText: "Rechercher des activité ...",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Des thèmes pour vous inspirez",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10.0),
          buildResult(context),
        ]));
  }

  Widget buildResult(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: (name != "")
          ? FirebaseFirestore.instance
              .collection('categories')
              .where("title", arrayContains: name)
              .snapshots()
          : FirebaseFirestore.instance.collection("activities").snapshots(),
      builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        /*data['image'] ??*/
                            "https://www.elektroaktif.com.tr/assets/images/noimage.jpg",
                        width: 80,
                        height: 80,
                      ),
                      title: Text(data['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      subtitle:
                          const Text('', style: TextStyle(color: Colors.black)),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: LetsGoTheme.main,
                        size: 50,
                      ),
                      isThreeLine: true,
                    ),
                  );
                });
      },
    );
  }

  void initiateSearch(String val) {
    setState(() {
      name = val;
    });
  }

  void _onPressed() {
    print('aaaaa');
    _firestore
        .collection("categories")
        .where("subcategoryId")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data()['subcategoryId']);
      });
    });
  }
}
