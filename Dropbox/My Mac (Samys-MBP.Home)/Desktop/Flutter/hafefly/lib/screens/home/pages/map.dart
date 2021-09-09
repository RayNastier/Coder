import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(36.729843, 3.005858), zoom: 15);
  late GoogleMapController _googleMapController;
  // late Marker _origin;
  // late Marker _destination;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
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
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff191b2c), Color(0xff191c31), Color(0xff192270)],
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
            ),
          ),
        ));
  }
}
