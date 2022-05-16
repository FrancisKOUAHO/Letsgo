import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common/utils.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_return_appbar.dart';

class Itinerary extends StatefulWidget {
  @override
  _ItineraryState createState() => _ItineraryState();
}

class _ItineraryState extends State<Itinerary> {
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
    controller.setMapStyle(Utils.mapStyle);
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
      CameraPosition(target: LatLng(48.960796, 2.070022), zoom: 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child:
            CustomReturnAppBar('Itinéraire', Colors.black, LetsGoTheme.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: _markers,
            ),
          ),
        ],
      ),
    );
  }
}
