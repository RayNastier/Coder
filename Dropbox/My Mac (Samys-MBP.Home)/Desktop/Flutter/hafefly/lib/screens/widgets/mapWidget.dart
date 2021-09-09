import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// ignore: must_be_immutable
class MapWidget extends StatelessWidget {
  MapWidget({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  double latitude;
  double longitude;

  late GoogleMapController _googleMapController;

  void dispose() {
    _googleMapController.dispose();
  }

  Location _location = Location();
  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height / 3 + 20,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
      target: LatLng(latitude, longitude), zoom: 15),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
