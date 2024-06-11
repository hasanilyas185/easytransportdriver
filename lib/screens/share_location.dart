// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_transport_driver/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class ShareLocation extends StatefulWidget {
  const ShareLocation({
    Key? key,
    required this.driverId,
  }) : super(key: key);
  final int driverId;

  @override
  _ShareLocationState createState() => _ShareLocationState();
}

class _ShareLocationState extends State<ShareLocation> {
  final Location _location = Location();

  @override
  void initState() {
    super.initState();
    _updateLocation();
  }

  void _updateLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData currentLocation) {
      FirebaseFirestore.instance
          .collection('drivers')
          .doc(widget.driverId.toString())
          .set({
        'location':
            GeoPoint(currentLocation.latitude!, currentLocation.longitude!),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: const Icon(Icons.arrow_back)),
          title: const Text('Live Track'),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            return false;
          },
          child: const Center(
            child: Text('Updating location...'),
          ),
        ));
  }
}
