import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/views/ticket/ticket.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final Stream<QuerySnapshot> _bookingStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("booking")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _bookingStream,
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
          return Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "Activité reservé",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> booking =
                          document.data()! as Map<String, dynamic>;
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                             /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Ticket()),
                              );*/
                            },
                            child: Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: 200.0,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://cdn.pixabay.com/photo/2016/11/29/03/30/woman-1867074_1280.jpg'),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          booking['serviceName'],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              booking['bookingStart'],
                                              style: const TextStyle(
                                                color: LetsGoTheme.main,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '${booking['servicePrice']}€',
                                              style: const TextStyle(
                                                color: LetsGoTheme.main,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Text(
                                              "categorie",
                                              style: TextStyle(
                                                color: LetsGoTheme.main,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                    ],
                                  ),
                                  Positioned(
                                    top: 190,
                                    right: 2.0,
                                    child: Container(
                                      color: LetsGoTheme.main,
                                      padding: const EdgeInsets.all(4.5),
                                      child: const Text(
                                        "En attente de validation",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          );
        });
  }
}
