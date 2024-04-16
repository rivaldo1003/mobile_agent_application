import 'package:elderselettricomobile/data/repository/auth_repository_impl.dart';
import 'package:elderselettricomobile/data/repository/config_repository_impl.dart';
import 'package:elderselettricomobile/data/source/local/config_local_datasource.dart';
import 'package:elderselettricomobile/domain/repository/auth_repository.dart';
import 'package:elderselettricomobile/domain/repository/config_repository.dart';
import 'package:get/get.dart';
import '../data/repository/device_repository_impl.dart';
import '../data/repository/location_repository_impl.dart';
import '../data/repository/profile_repository_impl.dart';
import '../data/source/local/location_local_datasource.dart';
import '../data/source/local/profile_local_datasource.dart';
import '../data/source/remote/location_remote_datasource.dart';
import '../data/source/remote/profile_remote_datasource.dart';
import '../domain/repository/device_repository.dart';
import '../domain/repository/location_repository.dart';
import '../data/repository/vehicle_repository_impl.dart';
import '../data/source/local/vehicle_local_datasource.dart';
import '../data/source/remote/device_remote_datasource.dart';
import '../data/source/remote/vehicle_remote_datasource.dart';
import '../domain/repository/profile_repository.dart';
import '../domain/repository/vehicle_repository.dart';
import 'values/constants.dart';
import 'dio_client.dart';

void init() {
  Get.lazyPut(() => DioClient(API_BASE_URL).create());

  //repositories
  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(),
  );

  Get.lazyPut<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localSource: ProfileLocalDataSource(),
      remoteSource: ProfileRemoteDataSource(),
    ),
  );

  Get.lazyPut<VehicleRepository>(
    () => VehicleRepositoryImpl(
      VehicleLocalDataSource(),
      VehicleRemoteDataSource(),
    ),
  );

  Get.lazyPut<DeviceRepository>(
    () => DeviceRepositoryImpl(
      DeviceRemoteDataSource(),
    ),
  );

  Get.lazyPut<LocationRepository>(
    () => LocationRepositoryImpl(
      LocationLocalDataSource(),
      LocationRemoteDataSource(),
    ),
  );

  Get.lazyPut<ConfigRepository>(
    () => ConfigRepositoryImpl(
      ConfigLocalDataSource(),
    ),
  );
}
