import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController _mapController;

  final LatLng _initialLocation = LatLng(10.8231, 106.6297); // Tọa độ TP.HCM

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialLocation,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('initial'),
            position: _initialLocation,
            infoWindow: InfoWindow(title: 'TP.HCM', snippet: 'Thành phố Hồ Chí Minh'),
          ),
        },
      ),
    );
  }
}
