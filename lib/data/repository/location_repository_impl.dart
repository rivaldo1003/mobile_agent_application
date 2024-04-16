import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/data/source/remote/location_remote_datasource.dart';
import 'package:elderselettricomobile/domain/repository/location_repository.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:elderselettricomobile/domain/model/auto_complete_prediction.dart';

import '../../domain/model/direction_response.dart';
import '../../domain/model/place_search_history.dart';
import '../source/local/location_local_datasource.dart';

class LocationRepositoryImpl extends LocationRepository {
  LocationRepositoryImpl(this.localSource, this.remoteSource);

  final LocationLocalDataSource localSource;
  final LocationRemoteDataSource remoteSource;

  @override
  Future<Either<Exception, List<AutocompletePrediction>?>> getPlaceAutoComplete(
      String query, Position location) async {
    return remoteSource.getPlaceAutoComplete(query, location);
  }

  Future<Either<Exception, DirectionRoutes>> getDirections(
    double currentLat,
    double currentLong,
    double destLat,
    double destLang,
  ) {
    return remoteSource.getDirections(
        currentLat, currentLong, destLat, destLang);
  }

  Future<void> savePlaceSearchHistory(PlaceSearchHistory item) async {
    localSource.savePlaceSearchHistory(item);
  }

  Future<List<PlaceSearchHistory>> getPlaceSearchHistory() {
    return localSource.getPlaceSearchHistory();
  }

  @override
  Future<void> deleteSearchHistory() {
    return localSource.deletePlaceSearchHistory();
  }

  @override
  Future<void> deleteSearchHistoryById(List<String> placeIds) {
    return localSource.deletePlaceSeachHistoryById(placeIds);
  }
}
