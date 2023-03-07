import 'package:wru/data/model/app_user/app_user.dart';
import 'package:wru/data/model/card/card.dart';

abstract class ExchangeRepository {
  Future<void> saveNameCard(String uid);
  Future<void> saveMemo();
  Future<String> fetchImages();
  Future<NameCard> fetchMyNameCard(String uid, String docID);
  Future<List> fetchMyCardsDocId(String uid);
}
