import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../theme/letsgo_theme.dart';

class SearchMapsSectionDark extends StatefulWidget {
  const SearchMapsSectionDark({Key? key}) : super(key: key);

  @override
  _SearchMapsSectionState createState() => _SearchMapsSectionState();
}

class _SearchMapsSectionState extends State<SearchMapsSectionDark> {
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

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyle);
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('id-1'),
          position: const LatLng(48.856614, 2.3522219),
          icon: mapMarker,
        ),
      );
    });
  }

  static const CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(48.856014, 2.3522219),
      zoom: 17); // Latitude centré = latitudeInitiale - 00.0006

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 390,
            height: 500,
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            color: Colors.black,
            child: Container(
              margin: const EdgeInsets.all(15),
             /* child: GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                scrollGesturesEnabled: true,
                compassEnabled: true,
                onMapCreated: _onMapCreated,
              ),*/
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.fromLTRB(30, 20, 13, 0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  LetsGoTheme.white,
                  LetsGoTheme.white,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                iconSize: 25.0,
                onPressed: () => Navigator.of(context).pop(),
                icon: const FaIcon(FontAwesomeIcons.phone),
                color: LetsGoTheme.main,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.fromLTRB(30, 20, 50, 0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  LetsGoTheme.white,
                  LetsGoTheme.white,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const IconButton(
                iconSize: 25.0,
                onPressed: null,
                icon: FaIcon(FontAwesomeIcons.maximize),
                color: LetsGoTheme.main,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Utils {
  static String mapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      },
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]
  ''';
}
