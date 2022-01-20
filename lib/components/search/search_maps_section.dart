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
  CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(20.5937, 78.9629));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
