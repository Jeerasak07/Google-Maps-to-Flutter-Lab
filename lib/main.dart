import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(17.806929996335562, 102.74609303287139);
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker(LatLng position, String markerId) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(markerId),
          position: position,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps to Flutter'),
          backgroundColor: Color.fromARGB(255, 19, 220, 167),
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
              markers: markers,
            ),
            Align(
              alignment: Alignment.bottomLeft, // ปรับตำแหน่งเป็นด้านซ้ายล่าง
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    _addMarker(
                      LatLng(17.806929996335562, 102.74609303287139),
                      "Khon Kaen University Nong Khai Campus มหาวิทยาลัย ขอนแก่น วิทยาเขต หนองคาย",
                    );
                  },
                  tooltip: 'Add Marker',
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
