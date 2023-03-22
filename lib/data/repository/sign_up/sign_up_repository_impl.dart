import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/data_source/firebase/auth/auth_data_source_impl.dart';
import 'package:wru/data/data_source/firebase/firesotre/users_data_source_impl.dart';
import 'package:wru/data/model/result/result.dart';
import 'package:wru/data/model/app_user/app_user.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/repository/sign_up/sign_up_repository.dart';

final signUpRepositoryProvider = Provider((ref) => SignUpRepositoryImpl(ref));

class SignUpRepositoryImpl implements SignUpRepository {
  SignUpRepositoryImpl(this._ref);
  final Ref _ref;
  late final _authDataSource = _ref.read(authDataSourceProvider);
  late final _usersDataSource = _ref.read(usersDataSourceProvider);

  @override
  Future<Result<AppUser?>> signUp(String email, String password) async {
    return Result.guardFuture(() async {
      User? user = await _authDataSource.signUp(email, password);
      if (user == null) {
        return null;
      }
      AppUser appUser = AppUser.fromFirebaseUser(user);
      await _usersDataSource.create(appUser);
      return appUser;
    });
  }
}
