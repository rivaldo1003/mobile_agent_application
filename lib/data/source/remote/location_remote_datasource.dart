import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:elderselettricomobile/domain/model/direction_response.dart';
import 'package:elderselettricomobile/core/values/constants.dart';
import 'package:geolocator/geolocator.dart';

import '../../../domain/model/auto_complete_prediction.dart';
import '../../../domain/model/place_auto_complete_response.dart';

class LocationRemoteDataSource {
  final _dio = Dio();

  Future<Either<Exception, List<AutocompletePrediction>?>> getPlaceAutoComplete(
      String query, Position location) async {
    try {
      final response = await _dio.get(
        '$MAPS_API_BASE_URL/place/autocomplete/json',
        queryParameters: {
          'input': query,
          'key': MAPS_API_KEY,
          'location': '${location.latitude},${location.longitude}',
          'origin': '${location.latitude},${location.longitude}',
          'radius': 50000.toString(),
        },
      );

      if (response.statusCode == 200) {
        final result = PlaceAutocompleteResponse.fromJson(response.data);
        return Right(result.predictions);
      } else {
        return Left(RequestException('Failed to fetch place suggestion'));
      }
    } catch (e) {
      return Left(RequestException(e.toString()));
    }
  }

  Future<Either<Exception, DirectionRoutes>> getDirections(
    double currentLat,
    double currentLong,
    double destLat,
    double destLang,
  ) async {
    try {
      final response = await _dio.get(
        '$MAPS_API_BASE_URL/directions/json',
        queryParameters: {
          'origin': '$currentLat,$currentLong',
          'destination': '$destLat,$destLang',
          'avoid': 'tolls',
          'key': MAPS_API_KEY,
        },
      );

      if (response.statusCode == 200) {
        final directionResponse = DirectionRoutes.fromJson(response.data);
        return Right(directionResponse);
      } else {
        return Left(RequestException('Failed to fetch direction'));
      }
    } catch (e) {
      return Left(RequestException(e.toString()));
    }
  }

  Future<Either<Exception, ElevationResponse>> getElevation(
      String polyline) async {
    try {
      final response = await _dio.get(
        '$MAPS_API_BASE_URL/elevation/json',
        queryParameters: {
          'path': "enc:$polyline",
          'key': MAPS_API_KEY,
        },
      );

      if (response.statusCode == 200) {
        final elevationResponse = ElevationResponse.fromJson(response.data);
        return Right(elevationResponse);
      } else {
        return Left(RequestException('Failed to fetch elevation'));
      }
    } catch (e) {
      return Left(RequestException(e.toString()));
    }
  }
}
