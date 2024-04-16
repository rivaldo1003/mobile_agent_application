import 'dart:async';

import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:elderselettricomobile/domain/model/direction_response.dart';
import 'package:elderselettricomobile/domain/model/result.dart';
import 'package:elderselettricomobile/domain/model/trip.dart';
import 'package:elderselettricomobile/domain/model/vehicle.dart';
import 'package:elderselettricomobile/core/values/constants.dart';
import 'package:elderselettricomobile/core/utils/extensions.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/base/base_view_model.dart';
import '../../../domain/repository/location_repository.dart';
import '../../../domain/repository/vehicle_repository.dart';

class EstimatedTripViewModel extends BaseViewModel {
  EstimatedTripViewModel({required this.currentTrip});

  final locationRepository = Get.find<LocationRepository>();
  final vehicleRepository = Get.find<VehicleRepository>();

  ResultState<Vehicle> vehicleState = ResultState.loading();
  StreamSubscription<Position>? _positionStream;
  DirectionRoutes? directionRoutes = null;
  Vehicle? currentVehicle = null;
  String? currentAddress = null;
  Position? currentPosition;
  double? distance = null;
  Trip currentTrip;

  void getCurrentLocation() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    _positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((position) {
      _getCurrentAddress(position);
      currentPosition = position;
    });
  }

  Future<void> getDirections() async {
    final response = await locationRepository.getDirections(
      currentTrip.currentLat,
      currentTrip.currentLong,
      currentTrip.destLat,
      currentTrip.destLong,
    );

    response.fold((l) {}, (direction) {
      distance = direction.distance / 1000;
      directionRoutes = direction;
      notifyListeners();
    });
  }

  Future<void> getVehicleByDeviceId() async {
    final pref = await SharedPreferences.getInstance();
    final deviceId = pref.getString(KEY_LAST_CONNECTED_DEVICE);
    if (deviceId != null) {
      final vehicle = await vehicleRepository.getVehicleByDeviceId(deviceId);
      if (vehicle != null) {
        currentVehicle = vehicle;
        vehicleState = ResultState.success(vehicle);
        notifyListeners();
        return;
      }
    }

    vehicleState = ResultState.error(VehicleNotFoundException());
    notifyListeners();
  }

  void _getCurrentAddress(Position position) {
    placemarkFromCoordinates(position.latitude, position.longitude)
        .then((placemarks) {
      final placemark = placemarks[0];
      currentAddress = placemark.toFullAddress();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }
}
