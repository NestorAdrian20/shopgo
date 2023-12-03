import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
//import 'package:shopgo/src/location/determine_position.dart';

@RoutePage()
class MapApp extends StatefulWidget {
  const MapApp({super.key});

  @override
  State<MapApp> createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapas'),
      ),
      body: osm(),
    );
  }

  OSMFlutter osm() {
    //double value = determinePosition();
    double lat = 16.8949904; //value.latitude;
    double long = -92.066797; //value.longitude;

    final mapController = MapController.withPosition(
      initPosition: GeoPoint(
        latitude: lat,
        longitude: long,
      ),
    );

    return OSMFlutter(
        controller: mapController,
        osmOption: OSMOption(
          //userTrackingOption: const UserTrackingOption(
          //enableTracking: true,
          //unFollowUser: false,
          //),
          zoomOption: const ZoomOption(
            initZoom: 17,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          userLocationMarker: UserLocationMaker(
            personMarker: const MarkerIcon(
              icon: Icon(
                Icons.location_history_rounded,
                color: Colors.red,
                size: 48,
              ),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(
                Icons.double_arrow,
                size: 48,
              ),
            ),
          ),
          roadConfiguration: const RoadOption(
            roadColor: Colors.yellowAccent,
          ),
          markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
            icon: Icon(
              Icons.person_pin_circle,
              color: Colors.blue,
              size: 56,
            ),
          )),
        ));
  }
}
