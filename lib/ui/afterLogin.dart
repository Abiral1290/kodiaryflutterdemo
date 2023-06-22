import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utilis/constants.dart';

class AfterLogin extends StatelessWidget {
    AfterLogin({Key? key}) : super(key: key);


  final Set<Polygon> _polygon =  HashSet<Polygon>();
  static final CameraPosition _kInitialPosition =
  CameraPosition(target: LatLng(Constants.latitude!, Constants.longitude!), zoom: 11.0, tilt: 0, bearing: 0);


    List<LatLng> points = [
      LatLng(Constants.latitude!, Constants.longitude!),
     const LatLng(27.8085741,85.3486241),
      const LatLng(27.8585741, 85.3286241),
      const LatLng(27.8285741, 85.3186241),
    ];

  @override
  Widget build(BuildContext context) {


    _polygon.add(
        Polygon(
          // given polygonId
          polygonId: PolygonId('1'),
          // initialize the list of points to display polygon
          points: points,
          // given color to polygon
          fillColor: Colors.green.withOpacity(0.3),
          // given border color to polygon
          strokeColor: Colors.green,
          geodesic: true,
          // given width of border
          strokeWidth: 4,
        )
    );
    return  Scaffold(
     appBar:    AppBar(
       backgroundColor: Constants.appColor,
     ),
      body:
      GoogleMap(
        mapType: MapType.hybrid,
        //initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          //  _controller.complete(controller);
        }, initialCameraPosition:   _kInitialPosition,
        myLocationEnabled: true,
        polygons: _polygon,

      ),
    );
  }
}
