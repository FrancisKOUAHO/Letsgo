import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

class Ticket extends StatefulWidget {
  const Ticket({
    Key? key,
  }) : super(key: key);

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LetsGoTheme.main,
        elevation: 0,
        leadingWidth: 100,
        leading: Container(
          width: 60,
          height: 30,
          margin: const EdgeInsets.fromLTRB(30, 0, 13, 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              LetsGoTheme.white.withOpacity(0.9),
              LetsGoTheme.white.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            iconSize: 25.0,
            onPressed: () => Navigator.of(context).pop(),
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
            color: LetsGoTheme.main,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FlutterTicketWidget(
          width: 350.0,
          height: 500.0,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.green),
                      ),
                      child: const Center(
                        child: Text(
                          'Business Class',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    Row(
                      children: const <Widget>[
                        Text(
                          'SLM',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.flight_takeoff,
                            color: Colors.pink,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'BTL',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Flight Ticket',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: <Widget>[
                      ticketDetailsWidget(
                          'Passengers', 'Ilona', 'Date', '24-12-2018'),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                        child: ticketDetailsWidget(
                            'Flight', '76836A45', 'Gate', '66B'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                        child: ticketDetailsWidget(
                            'Class', 'Business', 'Seat', '21B'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
                  child: Container(
                    width: 250.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://thumbs.dreamstime.com/b/barcode-vector-icon-bar-code-web-barcode-vector-icon-bar-code-web-white-background-169690153.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
                  child: Text(
                    '9824 0972 1742 1298',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  int _ticketCount = 0;

  Row counterWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () {
              if (_ticketCount > 0) {
                setState(() {
                  _ticketCount--;
                });
              }
            }),
        Expanded(
          child: Text(
            "$_ticketCount",
            // ticket.selectedTickets.value.toString(),
            maxLines: 1,
            softWrap: true,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.chevron_right,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _ticketCount++;
            });
          },
        ),
      ],
    );
  }
}
