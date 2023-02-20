import 'package:wru/data/model/result/result.dart';
import 'package:wru/data/model/app_user/app_user.dart';

abstract class SignUpRepository {
  Future<Result<AppUser?>> signUp(String email, String password);
}
