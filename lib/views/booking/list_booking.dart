import 'package:LetsGo/views/home/home.dart';
import 'package:flutter/material.dart';

import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_return_appbar.dart';
import '../../widgets/not_available_yet.dart';
import '../ticket/ticket_screen.dart';

class ListBooking extends StatefulWidget {
  const ListBooking({
    Key? key,
  }) : super(key: key);

  @override
  State<ListBooking> createState() => _ListBookingState();
}

class _ListBookingState extends State<ListBooking>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LetsGoTheme.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomReturnAppBar(
            'Vos réservations', Colors.transparent, LetsGoTheme.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: LetsGoTheme.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: LetsGoTheme.black,
                          labelColor: LetsGoTheme.white,
                          indicatorColor: LetsGoTheme.main,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: LetsGoTheme.main,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: 'A venir',
                            ),
                            Tab(
                              text: 'Passées',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      TicketScreen(),
                      NotAvailableYet(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
