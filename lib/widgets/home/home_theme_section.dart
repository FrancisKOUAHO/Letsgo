import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class HomeThemeSection extends StatelessWidget {
  const HomeThemeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _activitiesStream =
    FirebaseFirestore.instance.collection('activities').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _activitiesStream,
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

          return Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> activity =
                  document.data()! as Map<String, dynamic>;
                  return Card(
                    child: ListTile(
                      leading: Image.network(activity["image"] ?? "https://www.elektroaktif.com.tr/assets/images/noimage.jpg",
                        width: 80,
                        height: 80,
                      ),
                      title: Text(activity['titleCategory'] ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      subtitle:  Text(activity['title'] ?? '',
                          style: const TextStyle(color: Colors.black)),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: LetsGoTheme.main,
                        size: 50,
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
