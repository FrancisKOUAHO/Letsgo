import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/mapbottompill.dart';
import '../profil/profil_screen.dart';

const LatLng sourceLocation = LatLng(42.7477863, -71.1699932);
const LatLng destLocation = LatLng(42.744421, -71.1698939);
const double cameraZoom = 16;
const double cameraTilt = 80;
const double cameraBearing = 30;
const double pinVisiblePosition = 20;
const double pinInvisiblePosition = -220;

class ResearchViaMaps extends StatefulWidget {
  const ResearchViaMaps({Key? key}) : super(key: key);

  @override
  _ResearchViaMapsState createState() => _ResearchViaMapsState();
}

class _ResearchViaMapsState extends State<ResearchViaMaps> {
  final Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  final Set<Marker> _markers = <Marker>{};
  double pinPillPosition = pinVisiblePosition;

  late LatLng currentLocation;
  late LatLng destinationLocation;

  @override
  void initState() {
    super.initState();

    setInitialLocation();

    setSourceAndDestinationMarkerIcons(context);
  }

  void setSourceAndDestinationMarkerIcons(BuildContext context) async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.0),
      "assets/images/gps-3.png",
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        'assets/images/gps-3.png');
  }

  void setInitialLocation() {
    currentLocation = LatLng(sourceLocation.latitude, sourceLocation.longitude);

    destinationLocation = LatLng(destLocation.latitude, destLocation.longitude);
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    setSourceAndDestinationMarkerIcons(context);

    CameraPosition initialCameraPosition = const CameraPosition(
        zoom: cameraZoom,
        tilt: cameraTilt,
        bearing: cameraBearing,
        target: sourceLocation);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Image.network(user!.photoURL ??
                "https://cdn.pixabay.com/photo/2016/04/22/04/57/graduation-1345143_1280.png"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilScreen()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: true,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onTap: (LatLng loc) {
                setState(() {
                  pinPillPosition = pinInvisiblePosition;
                });
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                showPinsOnMap();
              },
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: pinPillPosition,
            child: MapBottomPill(),
          ),
        ],
      ),
    );
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          markerId: const MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
          onTap: () {
            setState(() {
              pinPillPosition = pinVisiblePosition;
            });
          }));

      _markers.add(
        Marker(
            markerId: const MarkerId('destinationPin'),
            position: currentLocation,
            icon: destinationIcon,
            onTap: () {
              setState(() {
                pinPillPosition = pinVisiblePosition;
              });
            }),
      );
    });
  }
}
