import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/resume_word.dart';
import '../../views/event/event_screen.dart';
import '../../theme/letsgo_theme.dart';

class SearchListAventure extends StatefulWidget {
  const SearchListAventure({Key? key}) : super(key: key);

  @override
  _SearchListAventureState createState() => _SearchListAventureState();
}

class _SearchListAventureState extends State<SearchListAventure> {
  final Stream<QuerySnapshot> _categoriesStream =
      FirebaseFirestore.instance.collection('activities').limit(20).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _categoriesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Quelque chose a mal tourné',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Chargement...',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            );
          }

          return Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> activity =
                    document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1.5,
                          blurRadius: 5,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
              }).toList(),
            ),
          );
        });
  }
}
