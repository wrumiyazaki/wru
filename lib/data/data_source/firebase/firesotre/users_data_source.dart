import 'package:wru/data/model/app_user/app_user.dart';

abstract class UsersDataSource {
  void create(AppUser appUser);
}
