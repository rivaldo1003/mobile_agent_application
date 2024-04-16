import 'package:dio/dio.dart';
import 'package:elderselettricomobile/data/source/profile_datasource.dart';
import 'package:get/get.dart';

import '../../../domain/model/profile.dart';

class ProfileRemoteDataSource extends ProfileDataSource {
  @override
  Future<ProfileAccount?> getProfile() async {
    final dio = Get.find<Dio>();

    try {
      final response = await dio.get('/user/profile');
      if (response.statusCode == 200) {
        final responseValue = response.data['value'];
        if (responseValue == null) return null;
        final profile = Profile.fromJson(responseValue);
        final accounts = <Account>[];
        final accountJson = responseValue['accounts'] as List<dynamic>;
        accountJson.forEach((element) {
          accounts.add(Account.fromJson(element));
        });

        return ProfileAccount(profile: profile, accounts: accounts);
      }
    } catch (e) {}
    return null;
  }
}
