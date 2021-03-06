import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

import '../../common/resume_word.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_return_appbar.dart';
import 'list_booking.dart';

class BookingActivity extends StatefulWidget {
  final activity;

  const BookingActivity({Key? key, required this.activity}) : super(key: key);

  @override
  State<BookingActivity> createState() => _BookingActivityState();
}

class _BookingActivityState extends State<BookingActivity> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final now = DateTime.now();
  late BookingService mockBookingService;
  String serviceId = const Uuid().v1();

  @override
  void initState() {
    super.initState();
    mockBookingService = BookingService(
        serviceName: widget.activity['titleCategory'],
        serviceId: widget.activity['image'],
        servicePrice: int.parse(splitsTheString(widget.activity['price'])[0]),
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
     Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
     FirebaseFirestore.instance
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("booking")
        .doc(serviceId)
        .set(mockBookingService.toJson());

    Fluttertoast.showToast(
        msg: 'votre réservation a été prise en compte',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 20.0);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListBooking()),
    );
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    DateTime first = now;
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    return converted;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.activity);
    return Scaffold(
      backgroundColor: LetsGoTheme.white,
      appBar:  PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomReturnAppBar('Réservation', Colors.transparent, LetsGoTheme.black),
      ),
      body: Center(
        child: BookingCalendar(
          bookingService: mockBookingService,
          bookingButtonText: 'Valider',
          bookedSlotText: 'Réservé',
          selectedSlotText: 'Sélectionné',
          availableSlotText: 'Disponible',
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
        ),
      ),
    );
  }
}
