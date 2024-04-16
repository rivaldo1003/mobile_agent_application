import 'package:hive/hive.dart';

part 'place_search_history.g.dart';

@HiveType(typeId: 3)
class PlaceSearchHistory {
  @HiveField(0)
  String id;

  @HiveField(1)
  String mainText;

  @HiveField(2)
  String? secondaryText;

  @HiveField(3)
  int createdTime;

  @HiveField(4)
  int? distance;

  PlaceSearchHistory({
    required this.id,
    required this.mainText,
    this.secondaryText,
    required this.createdTime,
    this.distance,
  });
}
