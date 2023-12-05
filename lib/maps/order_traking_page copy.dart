import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopgo/maps/constants.dart';
import 'package:location/location.dart';
import 'package:shopgo/src/services/firebase/firestore/firestore_service.dart';

@RoutePage()
class OrderTrackingPageCopy extends StatefulWidget {
  const OrderTrackingPageCopy({super.key});

  @override
  State<OrderTrackingPageCopy> createState() => OrderTrackingPageCopyState();
}

class OrderTrackingPageCopyState extends State<OrderTrackingPageCopy> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(16.903534, -92.092918);
  static const LatLng destination = LatLng(16.903534, -92.092918);
  //static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    // ...

    location.onLocationChanged.listen((newLoc) async {
      currentLocation = newLoc;

      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          //locationUsersPedidos(user.uid, newLoc.latitude!, newLoc.longitude!);

          // Obtener la ubicación del usuario que ejecuta el servicio desde Firestore
          _firestore
              .collection('users')
              .doc('PVAmqrY6XFUyu7fYcC80er347sz2') //user.uid)
              .get()
              .then((snapshot) {
            if (snapshot.exists) {
              GeoPoint newLoc = snapshot.get('ubicacion');
              // Actualizar la ubicación en el mapa
              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    zoom: 15.5,
                    target: LatLng(newLoc.latitude, newLoc.longitude),
                  ),
                ),
              );
              setState(() {});
            }
          });
        }
      });

      // ...
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        google_api_key,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude));
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/Pin_source.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/Pin_destination.png")
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/Badge.png")
        .then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track order",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  zoom: 15.5),
              polylines: {
                Polyline(
                    polylineId: const PolylineId("route"),
                    points: polylineCoordinates,
                    color: primaryColor,
                    width: 6),
              },
              markers: {
                Marker(
                    markerId: const MarkerId("currentLocation"),
                    icon: currentLocationIcon,
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!)),
                Marker(
                    markerId: const MarkerId("source"),
                    icon: sourceIcon,
                    position: sourceLocation),
                Marker(
                    markerId: const MarkerId("destination"),
                    icon: destinationIcon,
                    position: destination)
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            ),
    );
    //);
  }
}
