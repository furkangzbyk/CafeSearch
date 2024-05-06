import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class girismaps extends StatefulWidget {
  const girismaps({super.key});

  @override
  State<girismaps> createState() => _girismapsState();
}

// ignore: camel_case_types
class _girismapsState extends State<girismaps> {
  static final CameraPosition _kagithane =
      // ignore: prefer_const_constructors
      CameraPosition(target: LatLng(41.0838570, 28.9775033), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cafe Search")),
        body: GoogleMap(
          initialCameraPosition: _kagithane,
        ));
  }
}
