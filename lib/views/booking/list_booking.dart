import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:letsgo/views/ticket/ticket_screen.dart';

import '../../widgets/custom_app_bar.dart';

class ListBooking extends StatefulWidget {
  const ListBooking({Key? key}) : super(key: key);

  @override
  State<ListBooking> createState() => _ListBookingState();
}

class _ListBookingState extends State<ListBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Vos réservation',
              style: LetsGoTheme.reservation,
            ),
          ),
          const TicketScreen()
        ],
      ),
    );
  }
}
