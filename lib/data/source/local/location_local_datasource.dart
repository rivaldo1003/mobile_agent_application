import 'package:elderselettricomobile/domain/model/place_search_history.dart';

import '../../../core/utils/hive_util.dart';

class LocationLocalDataSource {
  Future<void> savePlaceSearchHistory(PlaceSearchHistory item) async {
    final box = HiveHelper.placeSearchHistoryBox();
    final totalSearch = box.keys.length;
    if (totalSearch == 5) {
      final searchList = await getPlaceSearchHistory(sort: 'ASC');
      final oldestSearch = searchList.first;
      await box.delete(oldestSearch);
    }
    await box.put(item.id, item);
  }

  Future<List<PlaceSearchHistory>> getPlaceSearchHistory(
      {String sort = 'DESC'}) async {
    final box = HiveHelper.placeSearchHistoryBox();
    final ids = box.keys;
    List<PlaceSearchHistory> history = [];
    await Future.wait(ids.map((id) async {
      final item = await box.get(id);
      if (item != null) {
        history.add(item);
      }
    }));
    if (sort == 'DESC') {
      history.sort((b, a) => a.createdTime.compareTo(b.createdTime));
    } else {
      history.sort((a, b) => a.createdTime.compareTo(b.createdTime));
    }

    return history;
  }

  Future<void> deletePlaceSearchHistory() {
    final box = HiveHelper.placeSearchHistoryBox();
    return box.clear();
  }

  Future<void> deletePlaceSeachHistoryById(List<String> placeIds) {
    final box = HiveHelper.placeSearchHistoryBox();
    return box.deleteAll(placeIds);
  }
}
