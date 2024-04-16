import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elderselettricomobile/domain/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/custom_exception.dart';
import '../../core/values/constants.dart';
import '../../core/values/strings.dart';
import '../../domain/repository/profile_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Exception, bool>> signIn() async {
    final googleSignIn = GoogleSignIn(
        scopes: [
          'https://www.googleapis.com/auth/userinfo.email',
          'https://www.googleapis.com/auth/userinfo.profile'
        ],
        clientId: Platform.isAndroid
            ? '821549797162-2p2gms03cnivmfs4kgnb2ijqiq4ul0k4.apps.googleusercontent.com'
            : Platform.isIOS
                ? '1006171488629-up2qb6bjrqadtlnsv98cji3bel1t5uhb.apps.googleusercontent.com'
                : '');
    try {
      final data = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await data!.authentication;
      var idToken = googleSignInAuthentication.idToken;

      var dio = Get.find<Dio>();
      final response = await dio.post(
        '/oauth2/signIn/google',
        data: {'idToken': idToken},
      );

      Map? responseData = response.data;
      final pref = await SharedPreferences.getInstance();
      String accessToken = responseData?['value'][KEY_ACCESS_TOKEN];
      String refreshToken = responseData?['value'][KEY_REFRESH_TOKEN];
      await pref.setString(KEY_ACCESS_TOKEN, accessToken);
      await pref.setString(KEY_REFRESH_TOKEN, refreshToken);

      final repository = Get.find<ProfileRepository>();
      await repository.getProfile();

      return Right(true);
    } catch (e) {
      String? errorMessage = null;
      if (e is DioError) {
        Map? responseData = e.response?.data;
        errorMessage = responseData?['message'];
      }
      return Left(
          RequestException(errorMessage ?? AppStrings.somethingIsWrong));
    }
  }
}
