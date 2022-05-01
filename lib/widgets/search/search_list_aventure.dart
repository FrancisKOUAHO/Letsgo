import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../views/event/event_screen.dart';
import '../../theme/letsgo_theme.dart';

class SearchListAventure extends StatefulWidget {
  const SearchListAventure({Key? key}) : super(key: key);

  @override
  _SearchListAventureState createState() => _SearchListAventureState();
}

class _SearchListAventureState extends State<SearchListAventure> {
  final Stream<QuerySnapshot> _categoriesStream =
      FirebaseFirestore.instance.collection('activities').snapshots();

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

          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> activity =
                      document.data()! as Map<String, dynamic>;
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        activity['image'] ??
                            "https://www.elektroaktif.com.tr/assets/images/noimage.jpg",
                        width: 80,
                        height: 80,
                      ),
                      title: Text(activity['title'] ?? 'Produit inconnu',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      subtitle:
                          const Text('', style: TextStyle(color: Colors.black)),
                      trailing: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  EventScreen(
                                      activity: activity
                                  )));
                        },
                        child: Image.asset("assets/icons/DetailButton.png"),
                      ),
                      isThreeLine: true,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        });
  }
}

/*
ResumeWord(category['description']) ?? ''*/
