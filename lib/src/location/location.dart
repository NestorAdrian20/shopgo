// ignore_for_file: avoid_print
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'determine_position.dart';

@RoutePage()
class GeolocatorWidget extends StatefulWidget {
  const GeolocatorWidget({super.key});

  @override
  State<GeolocatorWidget> createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<GeolocatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () async {
            Position position = await determinePosition();
            print('*******************************************************');
            print(position);
            print('*******************************************************');
          },
          icon: const Icon(Icons.access_alarm)),
      appBar: AppBar(
        title: const Text('Geolocator'),
      ),
      body: const Text('Geolocator'),
    );
  }
}
