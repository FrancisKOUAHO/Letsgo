import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/widgets/search/search_maps_section_dark.dart';

import '../booking/booking_activity.dart';

class EventScreen extends StatefulWidget {
  final activity;

  const EventScreen({Key? key, required this.activity}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        actions: [
          IconButton(
            iconSize: 30.0,
            onPressed: () {},
            icon: const Icon(Icons.heart_broken),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF111417),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "${widget.activity['image'] ?? "https://www.elektroaktif.com.tr/assets/images/noimage.jpg"}"),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: Column(children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                    constraints:
                        const BoxConstraints(maxHeight: double.infinity),
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                        Text("${widget.activity['titleCategory']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Text(
                            "${widget.activity['title']}",
                            style: const TextStyle(
                              color: LetsGoTheme.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.activity['price']} ${widget.activity['priceFrom']}  ",
                          style: const TextStyle(
                            color: LetsGoTheme.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star_rate, color: Colors.yellow),
                            Text(
                              "${widget.activity['averageRating']}",
                              style: const TextStyle(
                                color: LetsGoTheme.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                          BookingActivity(
                                            activity: widget.activity
                                        )),
                              );
                            },
                            color: LetsGoTheme.main,
                            textColor: LetsGoTheme.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text('Réserver'),
                          ),
                        ),
                      ],
                    )),
              ),
              const SearchMapsSectionDark(),
              containerHeaderImages(context),
              containerReviews(context)
            ]),
          ),
        ],
      ),
    );
  }
}

 containerHeaderImages(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
    transform: Matrix4.translationValues(0.0, -200.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
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
            image: const DecorationImage(
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
            image: const DecorationImage(
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
            image: const DecorationImage(
              image: AssetImage('assets/ressources/sport.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  );
} 

Widget containerReviews(BuildContext context){
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 15, 20, 0),
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
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
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
          singleReview(context),
          singleReview(context),
          singleReview(context),
        ],
      ),
    ),
  );
}

singleReview(BuildContext context){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
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
          padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
          child: SizedBox(
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
                    const Text(
                      'Hello World',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F7FF),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 3, 5, 3),
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
                            const Padding(
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
                const Padding(
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
}
