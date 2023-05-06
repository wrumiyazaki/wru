import 'package:wru/data/model/card/card.dart';

abstract class SentRepository {
  Future<Map<String, dynamic>?> fetchMyNameCard(String uid, String docID);
  Future<List> fetchMyCardsDocId(String uid);
}
