import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/resume_word.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_app_bar.dart';
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
        backgroundColor: LetsGoTheme.white,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: CustomAppBar(),
        ),
        body: ListView(children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
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
                  icon:
                      Image.asset("assets/Icons_v3/rechercher.png", width: 16),
                  onPressed: null,
                ),
                hintText: "Rechercher des activit?? ...",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: const Text(
              "Des th??mes pour vous inspirez",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          buildResult(context),
        ]));
  }

  Widget buildResult(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: (name != "")
          ? FirebaseFirestore.instance
              .collection('activities')
              .where("searchKeywords", arrayContains: name)
              .snapshots()
          : FirebaseFirestore.instance.collection("activities").snapshots(),
      builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, index) {
                  DocumentSnapshot activity = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(18, 6, 18, 6),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1.5,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
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
                                      "assets/Icons_v3/Detail_Button.svg",
                                      width: 30,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
