import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:letsgo/widgets/search/search_maps_section_dark.dart';
import 'package:letsgo/widgets/search/search_list_aventure.dart';
import 'package:letsgo/widgets/search/search_maps_section.dart';
import 'package:letsgo/widgets/search/search_search_section.dart';
import 'package:letsgo/widgets/search/search_title_section.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(),
        actions: [
          IconButton(
            iconSize: 30.0,
            onPressed: () {},
            icon: Icon(Icons.heart_broken),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF111417),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/ressources/male-motivation-muscular.png"),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: Column(children: [
              containerHeaderEvent,
              SearchMapsSectionDark(),
              containerHeaderImages,
              containerReviews
            ]),
          ),
        ],
      ),
    );
  }
}

Widget containerHeaderEvent = Container(
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
    child: Container(
        constraints: BoxConstraints(maxHeight: double.infinity),
        width: double.infinity,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Colors.grey.withOpacity(0.6),
            Colors.grey.withOpacity(0.6),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('3 séances de sport',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: Text(
                '45 Avenue de Paris',
                style: TextStyle(
                  color: Color.fromARGB(255, 194, 194, 194),
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              '94300, Vincennes',
              style: TextStyle(
                color: Color.fromARGB(255, 194, 194, 194),
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: RaisedButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text('Réserver'),
              ),
            ),
          ],
        )),
  ),
);

Widget containerHeaderImages = Container(
  padding: EdgeInsets.all(15),
  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
  transform: Matrix4.translationValues(0.0, -200.0, 0.0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('assets/ressources/male-motivation-muscular.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('assets/ressources/massage.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('assets/ressources/plage.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage('assets/ressources/sport.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ],
  ),
);

Widget containerReviews = Padding(
  padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
  child: Container(
    transform: Matrix4.translationValues(0.0, -200.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Avis',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        singleReview,
        singleReview,
        singleReview,
      ],
    ),
  ),
);

Widget singleReview = Padding(
  padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
  child: Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Image.network(
          'https://picsum.photos/seed/187/600',
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
        child: Container(
          width: 250,
          height: 100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello World',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F7FF),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 3, 5, 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdn.iconscout.com/icon/free/png-256/star-bookmark-favorite-shape-rank-16-28621.png',
                            width: 13,
                            height: 13,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              '4.5',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut gravida eu purus et posuere.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
