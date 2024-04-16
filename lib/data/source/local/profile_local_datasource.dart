import 'package:elderselettricomobile/data/source/profile_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/model/profile.dart';
import '../../../core/values/constants.dart';
import '../../../core/utils/hive_util.dart';

class ProfileLocalDataSource extends ProfileDataSource {
  @override
  Future<Profile?> getProfile() async {
    try {
      final profileBox = HiveHelper.profileBox();
      final profileIds = profileBox.keys;
      if (profileIds.isEmpty) {
        return null;
      } else {
        final profile = await profileBox.get(profileIds.first);
        return profile;
      }
    } catch (e) {}
    return null;
  }

  Future saveProfile(ProfileAccount profileAccount) async {
    final profile = profileAccount.profile;
    final accounts = profileAccount.accounts;
    final profileBox = HiveHelper.profileBox();
    final accountBox = HiveHelper.accountBox();
    await profileBox.put(profile.id, profile);
    accounts.forEach((element) {
      accountBox.put(element.id, element);
    });

    final pref = await SharedPreferences.getInstance();
    await pref.setString(profile.id, KEY_USER_ID);
  }

  Future<void> deleteProfile() async {
    final profileBox = HiveHelper.profileBox();
    final accountBox = HiveHelper.accountBox();
    await profileBox.clear();
    await accountBox.clear();
  }
}
