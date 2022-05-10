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
          return Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> booking =
                      document.data()! as Map<String, dynamic>;
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Ticket()),
                          );
                        },
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Card(
                            child: ListTile(
                              title: Text(booking['serviceName']),
                            ),
                            elevation: 4,
                            shadowColor: LetsGoTheme.main,
                            margin: const EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        });
  }
}
