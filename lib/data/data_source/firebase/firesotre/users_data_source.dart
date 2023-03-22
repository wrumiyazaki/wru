import 'package:wru/data/model/app_user/app_user.dart';

abstract class UsersDataSource {
  Future<void> create(AppUser appUser);
  Future<AppUser> fetch(String uid);
}
