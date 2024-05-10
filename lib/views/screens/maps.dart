import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController _mapController = MapController();
  LatLng _currentLocation = LatLng(36.806389, 10.1816670); // Default to (0, 0)
  List<Marker> _markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('ourNearestStore'.tr),
      ) ,
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _currentLocation,
          zoom: 6,
          maxZoom: 15,
        ),
        children: <Widget>[
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 45,
              size: const Size(40, 40),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(50),
              maxZoom: 15,
              markers: _markers,
              polygonOptions: const PolygonOptions(
                  borderColor: Colors.blueAccent,
                  color: Colors.black12,
                  borderStrokeWidth: 3),
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _locateUserAndAddMarkers,
        child: Icon(Icons.location_searching),
      ),
    );
  }

  Future<void> _locateUserAndAddMarkers() async {
    try {
      var locationData = await Location().getLocation();
      setState(() {
        _currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
        _markers = [
          Marker(
            width: 40.0,
            height: 40.0,
            point: _currentLocation,
            child: const Icon(Icons.person_pin_circle, color: Colors.blue, size: 40.0),
          ),
        ];
        _markers.addAll(_generateRandomMarkers(_currentLocation, 2, 0.01));
        _mapController.move(_currentLocation, 15.0);
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  List<Marker> _generateRandomMarkers(
      LatLng center, int count, double range) {
    var random = Random();
    List<Marker> markers = [];
    for (int i = 0; i < count; i++) {
      double lat = center.latitude +
          random.nextDouble() * range * (random.nextBool() ? 1 : -1);
      double lng = center.longitude +
          random.nextDouble() * range * (random.nextBool() ? 1 : -1);
      markers.add(
        Marker(
          width: 120.0,
          height: 40.0,
          point: LatLng(lat, lng),
          // Ktebbi Store icon
          child: Card(child: Container(
            padding: const EdgeInsets.all(8.0),
            child:  Text('Store'.tr),
            
          
          ),),
        ),
      );
    }
    return markers;
  }
}
