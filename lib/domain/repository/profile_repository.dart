import '../model/profile.dart';

abstract class ProfileRepository {
  Future<Profile?> getProfile();
  Future<void> deleteProfile();
}