import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_return_appbar.dart';

class Ticket extends StatefulWidget {
  final booking;

  Ticket({Key? key, this.booking}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  dynamic bookingTicketData;

  @override
  Widget build(BuildContext context) {
    bookingTicketData = widget.booking;
    return Scaffold(
      backgroundColor: LetsGoTheme.lightPurple,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomReturnAppBar('Billet', Colors.white, LetsGoTheme.black),
      ),
      body: Center(
        child: TicketWidget(
          width: 350,
          height: 500,
          isCornerRounded: true,
          padding: const EdgeInsets.all(20),
          child: TicketData(booking: bookingTicketData),
        ),
      ),
    );
  }
}

class TicketData extends StatefulWidget {
  final booking;

  const TicketData({Key? key, this.booking}) : super(key: key);

  @override
  State<TicketData> createState() => _TicketDataState();
}

class _TicketDataState extends State<TicketData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  'RÉSERVER',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'LETSGO',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            widget.booking["serviceName"],
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ticketDetailsWidget('Prénom', 'Noah', 'Nom', 'KOUAHO'),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                child: ticketDetailsWidget(
                    'Prix',
                    "${widget.booking['servicePrice'].toString()} €",
                    'Durée',
                    "${widget.booking['serviceDuration'].toString()} Minutes"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 80, right: 0),
          child: SizedBox(
            width: 150.0,
            height: 150.0,
            child: QrImage(
              data: "Prix: ${widget.booking['servicePrice'].toString()} €,"
                  "Durée: ${widget.booking['serviceDuration'].toString()} Minutes,"
                  "Activité reseré: ${widget.booking["serviceName"]}",
              version: QrVersions.auto,
              size: 800,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
          child: Text(
            '0000 +9230 2884 5163',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _showSimpleModalDialog(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              fixedSize: MaterialStateProperty.all(const Size(200, 40)),
            ),
            child: Text('ANNULER', style: TextStyle(color: LetsGoTheme.white)),
          ),
        )
      ],
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                secondTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

_showSimpleModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Souhaitez-vous annuler votre reservation ?",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          actions: [
            FlatButton(
              child: const Text("Oui",
                  style: TextStyle(color: Colors.red, fontSize: 16)),
              onPressed: () {},
            ),
            FlatButton(
              child: const Text("Non",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
