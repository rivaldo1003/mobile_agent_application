import 'package:elderselettricomobile/core/custom_exception.dart';
import 'package:elderselettricomobile/domain/repository/profile_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/base/base_view_model.dart';
import '../../domain/model/profile.dart';
import '../../domain/model/result.dart';
import 'package:get/get.dart';

import '../../flavors.dart';
import '../../core/values/constants.dart';

class ProfileViewModel extends StateViewModel<ResultState<Profile>> {
  final ProfileRepository repository = Get.find<ProfileRepository>();

  ProfileViewModel() : super(ResultState.loading());

  void getProfile() {
    if (FlavorConfig.appFlavor == Flavor.DEV) {
      Future.delayed(Duration.zero, () {
        state = ResultState.success(Profile(
          id: '',
          name: 'Elders Elettrico',
          username: '',
          email: 'elderselettrico@gmail.com',
          createdAt: '',
        ));
      });
      return;
    }

    repository.getProfile().then((value) {
      if (value != null) {
        state = ResultState.success(value);
      } else {
        state = ResultState.error(RequestException(''));
      }
    }).catchError((error, _) {
      state = ResultState.error(RequestException(''));
    });
  }

  Future logOut() async {
    await repository.deleteProfile();
    final pref = await SharedPreferences.getInstance();
    await pref.remove(KEY_LAST_CONNECTED_DEVICE);
    await pref.remove(KEY_ACCESS_TOKEN);
    final _signIn = GoogleSignIn();
    await _signIn.signOut();
  }
}
