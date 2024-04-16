import 'package:elderselettricomobile/domain/model/place_search_history.dart';
import 'package:elderselettricomobile/domain/model/profile.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/model/config/config_value.dart';
import '../../domain/model/vehicle.dart';

class HiveHelper {
  static const latestTypeId = 4;

  // Box names
  static String vehicle = 'vehicle';
  static String profile = 'profile';
  static String account = 'account';
  static String placeSearchHistory = 'place_search_history';
  static String config = 'config';

  static initialize() async {
    await Hive.initFlutter();

    /// Register adater and open box
    Hive.registerAdapter(VehicleAdapter());
    await Hive.openLazyBox<Vehicle>(HiveHelper.vehicle);

    Hive.registerAdapter(ProfileAdapter());
    await Hive.openLazyBox<Profile>(HiveHelper.profile);

    Hive.registerAdapter(AccountAdapter());
    await Hive.openLazyBox<Account>(HiveHelper.account);

    Hive.registerAdapter(PlaceSearchHistoryAdapter());
    await Hive.openLazyBox<PlaceSearchHistory>(HiveHelper.placeSearchHistory);

    Hive.registerAdapter(ConfigValueAdapter());
    await Hive.openLazyBox<ConfigValue>(HiveHelper.config);
  }

  /// Return opened box
  static LazyBox<Vehicle> vehicleBox() => Hive.lazyBox(HiveHelper.vehicle);

  static LazyBox<Profile> profileBox() => Hive.lazyBox(HiveHelper.profile);

  static LazyBox<Account> accountBox() => Hive.lazyBox(HiveHelper.account);

  static LazyBox<PlaceSearchHistory> placeSearchHistoryBox() =>
      Hive.lazyBox(HiveHelper.placeSearchHistory);

  static LazyBox<ConfigValue> configBox() => Hive.lazyBox(HiveHelper.config);
}
