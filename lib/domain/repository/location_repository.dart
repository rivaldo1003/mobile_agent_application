import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/domain/model/auto_complete_prediction.dart';
import 'package:geolocator/geolocator.dart';

import '../model/direction_response.dart';
import '../model/place_search_history.dart';

abstract class LocationRepository {
  Future<Either<Exception, List<AutocompletePrediction>?>> getPlaceAutoComplete(
    String query,
    Position location,
  );

  Future<Either<Exception, DirectionRoutes>> getDirections(
    double currentLat,
    double currentLong,
    double destLat,
    double destLang,
  );

  Future<void> savePlaceSearchHistory(PlaceSearchHistory item);

  Future<List<PlaceSearchHistory>> getPlaceSearchHistory();

  Future<void> deleteSearchHistory();

  Future<void> deleteSearchHistoryById(List<String> placeIds);
}
