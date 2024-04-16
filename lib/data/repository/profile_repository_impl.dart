import '../../domain/model/profile.dart';
import '../../domain/repository/profile_repository.dart';
import '../source/local/profile_local_datasource.dart';
import '../source/remote/profile_remote_datasource.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl({
    required this.localSource,
    required this.remoteSource,
  });

  final ProfileLocalDataSource localSource;
  final ProfileRemoteDataSource remoteSource;

  @override
  Future<Profile?> getProfile() async {
    final localResponse = await localSource.getProfile();
    if (localResponse == null) {
      final response = await remoteSource.getProfile();
      if (response != null) {
        await localSource.saveProfile(response);
      }
      return response?.profile;
    } else {
      return localResponse;
    }
  }

  @override
  Future<void> deleteProfile() {
    return localSource.deleteProfile();
  }
}
