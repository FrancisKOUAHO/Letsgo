import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../common/utils.dart';
import '../../theme/letsgo_theme.dart';
import '../../widgets/custom_app_bar/custom_return_appbar.dart';

class Itinerary extends StatefulWidget {
  @override
  _ItineraryState createState() => _ItineraryState();
}

class _ItineraryState extends State<Itinerary> {
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyAHyao01DJgw2BRSSKcB8PdrWAJmUHnElY";

  late BitmapDescriptor mapMarkerOrigin;
  late BitmapDescriptor mapMarkerDestinataire;

  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(48.9334458, 2.0492204);
  LatLng endLocation = const LatLng(48.960796, 2.070022);

  @override
  initState() {
    getDirections();
    setCustomMarkerOrigin();
    setCustomMarkerDestinataire();
    super.initState();
  }

  _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      markers.add(Marker(
        //add start location marker
        markerId: MarkerId(startLocation.toString()),
        position: startLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Starting Point ',
          snippet: 'Start Marker',
        ),
        icon: mapMarkerOrigin, //Icon for Marker
      ));

      markers.add(Marker(
        //add distination location marker
        markerId: MarkerId(endLocation.toString()),
        position: endLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: mapMarkerDestinataire,
      ));
    });
  }

  void setCustomMarkerOrigin() async {
    mapMarkerOrigin = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/map/destination_map_marker.png');
  }

  void setCustomMarkerDestinataire() async {
    mapMarkerDestinataire = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/map/Location_blue_sky.png');
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: LetsGoTheme.main,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

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
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            scrollGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: endLocation,
              zoom: 12.0,
            ),
            markers: markers,
            polylines: Set<Polyline>.of(polylines.values),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
          )),
        ],
      ),
    );
  }
}
