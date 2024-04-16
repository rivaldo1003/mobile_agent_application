import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class DirectionRoutes {
  int distance;
  String overviewPolylinePoints;
  List<PointLatLng> polylinePoints;
  DirectionBounds bounds;

  DirectionRoutes({
    required this.distance,
    required this.polylinePoints,
    required this.bounds,
    required this.overviewPolylinePoints,
  });

  factory DirectionRoutes.fromJson(Map<String, dynamic> json) {
    final route = json['routes'][0];
    final polylinePoints = route['overview_polyline']['points'];
    final leg = route['legs'][0];
    final steps = leg['steps'] as List;

    final path = <PointLatLng>[];
    steps.forEach(
      (element) {
        final points = element['polyline']['points'] as String;
        path.addAll(PolylinePoints().decodePolyline(points));
      },
    );

    return DirectionRoutes(
      distance: leg['distance']['value'],
      polylinePoints: path,
      bounds: DirectionBounds.fromJson(json['routes'][0]['bounds']),
      overviewPolylinePoints: polylinePoints,
    );
  }
}

class DirectionBounds {
  LocationLatLng northeast;
  LocationLatLng southwest;

  DirectionBounds({
    required this.northeast,
    required this.southwest,
  });

  factory DirectionBounds.fromJson(Map<String, dynamic> json) {
    return DirectionBounds(
      northeast: LocationLatLng.fromJson(json['northeast']),
      southwest: LocationLatLng.fromJson(json['southwest']),
    );
  }
}

class ElevationResponse {
  List<ElevationItem> elevationList;

  ElevationResponse({
    required this.elevationList,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'results': elevationList.map((elevation) => elevation.toJson()).toList(),
    };
  }

  factory ElevationResponse.fromJson(Map<String, dynamic> json) {
    final results = <ElevationItem>[];

    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(ElevationItem.fromJson(v));
      });
    }

    return ElevationResponse(
      elevationList: results,
    );
  }
}

class ElevationItem {
  double elevation;
  LocationLatLng location;

  ElevationItem({
    required this.elevation,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'elevation': elevation,
      'location': location.toJson(),
    };
  }

  factory ElevationItem.fromJson(Map<String, dynamic> json) {
    return ElevationItem(
      elevation: json['elevation'] as double,
      location: LocationLatLng.fromJson(json['location']),
    );
  }
}

class LocationLatLng {
  double lat;
  double lng;

  LocationLatLng({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory LocationLatLng.fromJson(Map<String, dynamic> json) {
    return LocationLatLng(
      lat: json['lat'] as double,
      lng: json['lng'] as double,
    );
  }
}
