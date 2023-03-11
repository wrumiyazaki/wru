import 'package:wru/data/model/app_user/app_user.dart';
import 'package:wru/data/model/card/card.dart';

abstract class ExchangeRepository {
  Future<void> saveReceivedCard(String uid);
  Future<String?> fetchImage();
  Future<String?> fetchFaceImage();
  Future<String?> fetchReceivedUid();
  Future<NameCard> fetchMyNameCard(String uid, String docID);
  Future<List> fetchMyCardsDocId(String uid);
}
