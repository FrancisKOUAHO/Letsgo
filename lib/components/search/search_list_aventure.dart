import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchListAventure extends StatefulWidget {
  const SearchListAventure({Key? key}) : super(key: key);

  @override
  _SearchListAventureState createState() => _SearchListAventureState();
}

class _SearchListAventureState extends State<SearchListAventure> {
  final Stream<QuerySnapshot> _categoriesStream =
      FirebaseFirestore.instance.collection("Categories").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _categoriesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> category =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(category['name']),
                  );
                }).toList(),
              ),
            ),
          );
        });
  }
}
