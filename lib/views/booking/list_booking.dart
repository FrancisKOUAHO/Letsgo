import 'package:flutter/material.dart';
import 'package:letsgo/views/ticket/ticket_screen.dart';

import '../../widgets/custom_return_appbar.dart';

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
        child: CustomReturnAppBar('Vos réservations'),
      ),
      body: Column(
        children: const [
          TicketScreen()
        ],
      ),
    );
  }
}
