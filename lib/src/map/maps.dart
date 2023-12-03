// ignore_for_file: avoid_print
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shopgo/config/routes/app_route.gr.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../location/determine_position.dart';

@RoutePage()
class MapsGeolocator extends StatefulWidget {
  const MapsGeolocator({super.key});

  @override
  State<MapsGeolocator> createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<MapsGeolocator> {
  String locationMessage = "Current Location of the User";
  late String lat;
  late String long;

  Future<void> openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }

  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'Latitude: $lat, Longitude: $long';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locationMessage, textAlign: TextAlign.center),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                determinePosition().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';

                  setState(() {
                    locationMessage = 'Latitude: $lat, Longitude: $long';
                  });
                  liveLocation();
                });
              },
              child: const Text('Get Current Location'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                openMap(lat, long);
              },
              child: const Text('Open Google Map'),
            ),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const MapApp());
              },
              child: const Text('OSM'),
            ),
          ],
        ),
      ),
    );
  }
}
