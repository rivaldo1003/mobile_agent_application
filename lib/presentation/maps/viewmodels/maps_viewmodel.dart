import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/base/base_view_model.dart';
import '../../../domain/model/direction_response.dart';
import '../../../domain/model/trip.dart';
import '../../../domain/model/vehicle.dart';

class MapsViewModel extends BaseViewModel {
  MapsViewModel() {
    getCustomMarker();
  }

  StreamSubscription<Position>? _positionStream;

  Vehicle? vehicle = null;
  Position? currentPosition;
  Trip? currentTrip = null;
  DirectionRoutes? currentRoutes = null;
  bool tripStart = false;

  final markers = Set<Marker>();
  final polylines = Set<Polyline>();

  List<LatLng> _polylineCoords = [];
  int _polylineIdCounter = 1;

  var _markerDestinationIcon = BitmapDescriptor.defaultMarker;

  Future<void> getCustomMarker() async {
    final data = await rootBundle.load("assets/icons/destination_location.png");
    final codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: 115);
    final fi = await codec.getNextFrame();
    final bytes = await fi.image.toByteData(format: ImageByteFormat.png);
    final uint8List = bytes?.buffer.asUint8List();
    if (uint8List != null) {
      _markerDestinationIcon = BitmapDescriptor.fromBytes(uint8List);
    }
  }

  Future<Position> _getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('Error' + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<Position> setupCurrentLocation() async {
    if (currentPosition != null) return currentPosition!;
    final position = await _getCurrentLocation();
    currentPosition = position;
    return position;
  }

  void getPositionStream() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    _positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((position) {
      currentPosition = position;
      print('MapScreen: ${position.latitude},${position.longitude}');
    });
  }

  void onStartTrip(Trip trip, DirectionRoutes routes) {
    currentTrip = trip;
    currentRoutes = routes;
    tripStart = true;
    _setDestinationMarker(LatLng(trip.destLat, trip.destLong));
    print('MapsViewModel, total polyline: ${routes.polylinePoints.length}');
    _setPolyline(routes.polylinePoints);
    getPositionStream();
    notifyListeners();
  }

  void _setDestinationMarker(LatLng points) {
    markers.add(
      Marker(
        markerId: MarkerId('marker'),
        position: points,
        icon: _markerDestinationIcon,
      ),
    );
  }

  void _setPolyline(List<PointLatLng> points) async {
    _polylineCoords =
        points.map((point) => LatLng(point.latitude, point.longitude)).toList();
    final String polylineVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;
    polylines.add(
      Polyline(
        jointType: JointType.round,
        geodesic: true,
        polylineId: PolylineId(polylineVal),
        width: 6,
        color: Colors.blue,
        points: _polylineCoords,
      ),
    );
  }

  void _calculateRemainingDistance() {}

  void cancelTrip() {
    _positionStream?.cancel();
    currentTrip = null;
    currentRoutes = null;
    polylines.clear();
    markers.clear();
    tripStart = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }
}
