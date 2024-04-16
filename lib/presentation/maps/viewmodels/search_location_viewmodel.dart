import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/domain/model/place_search_history.dart';
import 'package:elderselettricomobile/domain/repository/location_repository.dart';
import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:elderselettricomobile/domain/model/result.dart';
import 'package:elderselettricomobile/core/utils/extensions.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view_model.dart';
import '../../../domain/model/auto_complete_prediction.dart';

class SearchLocationViewModel extends BaseViewModel {
  final repository = Get.find<LocationRepository>();

  StreamSubscription<Position>? _positionStream;
  Position? currentPosition;
  String? currentAddress = null;
  List<PlaceSearchHistory> placeSearchHistory = [];

  ResultState<List<AutocompletePrediction>> autocompleteState =
      ResultState.init();

  void placeAutoComplete(String query) async {
    if (currentPosition == null) return;
    autocompleteState = ResultState.loading();
    notifyListeners();
    final response =
        await repository.getPlaceAutoComplete(query, currentPosition!);

    response.fold((e) {
      autocompleteState = ResultState.error(e);
    }, (autoComplete) {
      if (autoComplete != null && autoComplete.isNotEmpty) {
        autocompleteState = ResultState.success(autoComplete);
      } else {
        autocompleteState =
            ResultState.error(RequestException('Location not found'));
      }
    });

    notifyListeners();
  }

  void clearAutocomplete() {
    if (autocompleteState.isSuccess || autocompleteState.isError) {
      autocompleteState = ResultState.success([]);
      notifyListeners();
    }
  }

  void startCurrentLocationStream() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    _positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((position) {
      if (currentAddress == null) _getCurrentAddress(position);
      currentPosition = position;
    });
  }

  Future<void> getLastKnownPosition() async {
    currentPosition = await Geolocator.getLastKnownPosition();
  }

  void _getCurrentAddress(Position position) {
    placemarkFromCoordinates(position.latitude, position.longitude)
        .then((placemarks) {
      final placemark = placemarks[0];
      currentAddress = placemark.toFullAddress();
      notifyListeners();
    });
  }

  void getPlaceSearchHistory() {
    repository.getPlaceSearchHistory().then((value) {
      placeSearchHistory = value;
      notifyListeners();
    });
  }

  void savePlaceSearchHistory({
    required String id,
    required String mainText,
    String? secondaryText,
    int? distance,
  }) {
    final searchHistory = PlaceSearchHistory(
      id: id,
      mainText: mainText,
      secondaryText: secondaryText,
      createdTime: DateTime.now().millisecondsSinceEpoch,
      distance: distance,
    );
    repository.savePlaceSearchHistory(searchHistory);
  }

  void deleteSearchHistory() {
    repository.deleteSearchHistory().then((_) {
      placeSearchHistory = [];
      notifyListeners();
    });
  }

  void deleteSearchHistoryById(String placeId, int pos) {
    repository.deleteSearchHistoryById([placeId]).then((value) {
      placeSearchHistory.removeAt(pos);
      notifyListeners();
    });
  }

  Future<Tuple2<double, double>> getDestinationLatlong(
      String? description) async {
    double destLat = 0.0;
    double destLong = 0.0;

    try {
      if (description != null) {
        final destinationPos = await locationFromAddress(description);
        if (destinationPos.isNotEmpty) {
          destLat = destinationPos[0].latitude;
          destLong = destinationPos[0].longitude;
        }
      }
    } catch (e) {
      return Tuple2(destLat, destLong);
    }

    return Tuple2(destLat, destLong);
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }
}
