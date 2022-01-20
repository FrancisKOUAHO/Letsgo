import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:letsgo/theme/letsgo_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchMapsSection extends StatefulWidget {
  const SearchMapsSection({Key? key}) : super(key: key);

  @override
  _SearchMapsSectionState createState() => _SearchMapsSectionState();
}

class _SearchMapsSectionState extends State<SearchMapsSection> {
  static final CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(48.856614, 2.3522219),
      tilt: 59.440717697143555,
      zoom: 14.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10),
        width: 327,
        height: 400,
        child: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (GoogleMapController c) {},
        ),
      ),
    );
  }
}
