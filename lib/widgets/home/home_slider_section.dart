import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

import '../../screen/event/event_screen.dart';

class HomeSliderSection extends StatefulWidget {
  const HomeSliderSection({Key? key}) : super(key: key);

  @override
  _HomeSliderSectionState createState() => _HomeSliderSectionState();
}

class _HomeSliderSectionState extends State<HomeSliderSection> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _activitiesStream =
        FirebaseFirestore.instance.collection('activities').snapshots();

    final _mediaQuery = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _activitiesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return SizedBox(
            height: _mediaQuery.height * 0.4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> activity =
                    document.data()! as Map<String, dynamic>;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 254,
                        width: 209,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: NetworkImage(activity["image"] ??
                                "https://www.elektroaktif.com.tr/assets/images/noimage.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Card(
                              margin: const EdgeInsets.fromLTRB(80, 5, 5, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: LetsGoTheme.transparent,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const <Widget>[
                                  ListTile(
                                    leading: Icon(
                                      Icons.fitness_center_rounded,
                                      size: 25,
                                      color: LetsGoTheme.white,
                                    ),
                                    title: Text('Sport',
                                        style: TextStyle(
                                            color: LetsGoTheme.white,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              margin: const EdgeInsets.all(5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: LetsGoTheme.whiteTransparent,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    title: Text('3 séances de sport',
                                        style: TextStyle(
                                            color: LetsGoTheme.black,
                                            fontSize: 16)),
                                  ),
                                  const ListTile(
                                    leading: Icon(
                                      Icons.location_on_rounded,
                                      size: 25,
                                      color: LetsGoTheme.lightGrey,
                                    ),
                                    title: Text('45 avenu paris 92010',
                                        style: TextStyle(
                                            color: LetsGoTheme.lightGrey,
                                            fontSize: 14)),
                                  ),
                                  ButtonBar(children: [
                                    FlatButton(
                                      color: LetsGoTheme.whiteTransparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9.0)),
                                      child: const Text("Voir plus",
                                          style: TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 14)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EventScreen()),
                                        );
                                      },
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ));
      },
    );
  }
}
