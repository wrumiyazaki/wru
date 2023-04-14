import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/data_source/firebase/auth/auth_data_source_impl.dart';
import 'package:wru/data/data_source/firebase/firesotre/users_data_source_impl.dart';
import 'package:wru/data/model/result/result.dart';
import 'package:wru/data/model/app_user/app_user.dart';
import 'package:wru/data/repository/sign_in/sign_in_repository.dart';

final signInRepositoryProvider = Provider((ref) => SignInRepositoryImpl(ref));

class SignInRepositoryImpl implements SignInRepository {
  SignInRepositoryImpl(this._ref);
  final Ref _ref;
  late final _authDataSource = _ref.read(authDataSourceProvider);
  late final _usersDataSource = _ref.read(usersDataSourceProvider);

  @override
  Future<Result<AppUser?>> signIn(String email, String password) async {
    return Result.guardFuture(() async {
      User? user = await _authDataSource.signIn(email, password);
      if (user == null) {
        return null;
      }
      //取得したAppUserクラスを返す
      return await _usersDataSource.fetch(user.uid);
    });
  }
}
