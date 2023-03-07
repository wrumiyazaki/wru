import 'package:wru/data/model/app_user/app_user.dart';

abstract class ExchangeRepository {
  Future<void> saveNameCard(String uid);
  Future<void> saveMemo();
  Future<String> fetchImages();
  Future<String> fetchMyNameCard();
}
