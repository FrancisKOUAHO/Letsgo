import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../theme/letsgo_theme.dart';


class SearchMapsSection extends StatefulWidget {
  const SearchMapsSection({Key? key}) : super(key: key);

  @override
  _SearchMapsSectionState createState() => _SearchMapsSectionState();
}

class _SearchMapsSectionState extends State<SearchMapsSection> {
  LatLng startLocation = const LatLng(48.9334458, 2.0492204);
  LatLng endLocation = const LatLng(48.960796, 2.070022);
  late BitmapDescriptor mapMarker;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(50.0, 50.0)), 'assets/map/Subtract.png');
  }

  final List<Marker> _markers = [];

  @override
  void initState() {
    setCustomMarker();
    super.initState();

  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('id-1'),
          position: const LatLng(48.960796, 2.070022),
          icon: mapMarker,
        ),
      );
      _markers.add(
        Marker(
            markerId: const MarkerId('2'),
            position: const LatLng(48.960796, 2.070022),
            icon: mapMarker,
            infoWindow: const InfoWindow(title: 'Sheeesh')),
      );
      _markers.add(
        Marker(
            markerId: const MarkerId('3'),
            position: const LatLng(48.9134458, 2.0992204),
            icon: mapMarker,
            infoWindow: const InfoWindow(title: 'Sheeesh')),
      );
      _markers.add(
        Marker(
            markerId: const MarkerId('6'),
            position: const LatLng(48.9994458, 2.0992204),
            icon: mapMarker,
            infoWindow: const InfoWindow(title: 'Sheeesh')),
      );
      _markers.add(
        Marker(
            markerId: const MarkerId('7'),
            position: const LatLng(48.9434458, 2.0292204),
            icon: mapMarker,
            infoWindow: const InfoWindow(title: 'Sheeesh')),
      );
      _markers.add(
        Marker(
            markerId: const MarkerId('8'),
            position: const LatLng(48.9534458, 2.0492204),
            icon: mapMarker,
            infoWindow: const InfoWindow(title: 'Sheeesh')),
      );
      _markers.add(
        Marker(
            markerId: const MarkerId('9'),
            position: const LatLng(48.9634458, 2.0892204),
            icon: mapMarker,
            infoWindow: const InfoWindow(title: 'Sheeesh')),
      );
      _markers.add(
        Marker(
            markerId: const MarkerId('10'),
            position: const LatLng(48.9734458, 2.0592204),
            icon: mapMarker,
            infoWindow: const InfoWindow(title: 'Sheeesh')),
      );
    });
  }

  static const CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(48.960796, 2.070022), zoom: 12);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      width: 327,
      height: 400,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.89,
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: LetsGoTheme.white,
                  width: 12,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.55),
                    spreadRadius: 0.5,
                    blurRadius: 0,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                scrollGesturesEnabled: true,
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                markers: Set<Marker>.of(_markers),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
