import 'package:dartz/dartz.dart';
import 'package:elderselettricomobile/domain/repository/auth_repository.dart';
import 'package:get/get.dart';

class SignInViewModel {
  Future<Either<Exception, bool>> handleSignIn() async {
    final repository = Get.find<AuthRepository>();
    final response = await repository.signIn();
    return response;
  }
}
