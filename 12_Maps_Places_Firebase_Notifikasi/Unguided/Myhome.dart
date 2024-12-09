import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  static final LatLng _kMapCenter = LatLng(-6.9802828, 109.6908154);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  late GoogleMapController _mapController;

  Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId("marker_1"),
      position: _kMapCenter,
      infoWindow: const InfoWindow(title: 'Rumah Opung'),
      rotation: 90,
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _openPlacePicker() async {
    try {
      final LocationResult? result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            apiKey: "AIzaSyA5fQBvl4tmFk7FrBoCYj0bxHhOeMOfGhQ",
            initialLocation: LatLng(
              _kMapCenter.latitude,
              _kMapCenter.longitude,
            ),
          ),
        ),
      );

      if (result != null && result.latLng != null) {
        print("Place Picked: ${result.formattedAddress}");

        _mapController.animateCamera(
          CameraUpdate.newLatLng(result.latLng!),
        );

        setState(() {
          _markers.add(
            Marker(
              markerId: const MarkerId("picked_location"),
              position: result.latLng!,
              infoWindow: InfoWindow(
                title: "Picked Location",
                snippet: result.formattedAddress,
              ),
            ),
          );
        });
      }
    } catch (e) {
      print("Error picking place: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Google Maps',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: _openPlacePicker,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        zoomControlsEnabled: false,
        markers: _markers,
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
