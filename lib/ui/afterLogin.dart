import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AfterLogin extends StatelessWidget {
  const AfterLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    //  appBar:    AppBar(),
      body:    GoogleMap(
        mapType: MapType.hybrid,
        //initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          //  _controller.complete(controller);
        }, initialCameraPosition: const CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(37.43296265331129, -122.08832357078792),
          tilt: 59.440717697143555,
          zoom: 19.151926040649414)
      ),
    );
  }
}
