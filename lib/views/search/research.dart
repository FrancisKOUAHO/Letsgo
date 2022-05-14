import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/resume_word.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../event/event_screen.dart';

class Research extends StatefulWidget {
  const Research({Key? key}) : super(key: key);

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic data;

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: CustomAppBar(),
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
              .collection('activities')
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
                  DocumentSnapshot activity = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15, 15, 15, 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.network(
                                activity["image"] ??
                                    "https://www.elektroaktif.com.tr/assets/images/noimage.jpg",
                                width: 66,
                                height: 66,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    17, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/Category.png',
                                          width: 17,
                                          height: 17,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(7, 0, 0, 0),
                                          child: Text(
                                            activity['titleCategory'] ?? '',
                                            style: const TextStyle(
                                              color: Color(0xFF1D2429),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            ResumeWord(activity['title'] ?? ''),
                                            style: const TextStyle(
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 30, 0, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EventScreen(
                                                activity: activity)));
                                  },
                                    child: SvgPicture.asset(
                                      "assets/icons/Detail_Buttonblue.svg",
                                      width: 30,
                                    )),
                                ),
                              ),
                          ],
                        ),
                      ),
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
    _firestore
        .collection("categories")
        .where("subcategoryId")
        .get()
        .then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        result.data()['subcategoryId'];
      }
    });
  }
}
