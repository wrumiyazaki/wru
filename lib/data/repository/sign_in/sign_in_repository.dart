import 'package:wru/data/model/result/result.dart';
import 'package:wru/data/model/app_user/app_user.dart';

abstract class SignInRepository {
  Future<Result<AppUser?>> signIn(String email, String password);
}
