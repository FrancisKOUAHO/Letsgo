import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:letsgo/theme/letsgo_theme.dart';

import '../../common/utils.dart';

class SearchMapsSection extends StatefulWidget {
  const SearchMapsSection({Key? key}) : super(key: key);

  @override
  _SearchMapsSectionState createState() => _SearchMapsSectionState();
}

class _SearchMapsSectionState extends State<SearchMapsSection> {
  final Set<Marker> _markers = {};

  late BitmapDescriptor mapMarker;

  // BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/map/Location_blue_sky.png');
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
    });
  }

  static const CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(48.960796, 2.070022), zoom: 14);

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
              width: MediaQuery.of(context).size.width / 1.105,
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: LetsGoTheme.white,
                  width: 12,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                onMapCreated: _onMapCreated,
                markers: _markers,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
