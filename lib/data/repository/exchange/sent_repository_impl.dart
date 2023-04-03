import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/repository/exchange/sent_repositrory.dart';

final sentRepositoryProvider = Provider((ref) => SentRepositoryImpl(ref));

class SentRepositoryImpl implements SentRepository {
  SentRepositoryImpl(this._ref);
  final Ref _ref;
  late FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';
  final myCardsCollection = 'myCards';

  //送るために自分の名刺を取得する
  @override
  Future<NameCard> fetchMyNameCard(String uid, String docID) async {
    final NameCard nameCard = await db
        .collection(usersCollection)
        .doc(uid)
        .collection(myCardsCollection)
        .doc(docID)
        .get()
        .then((snapshot) => NameCard.fromJson(snapshot.data()!));
    return nameCard;
  }

  //myCardsのDocumentIDのListを取得する
  @override
  Future<List> fetchMyCardsDocId(String uid) async {
    List docList = [];
    await db
        .collection(usersCollection)
        .doc(uid)
        .collection(myCardsCollection)
        .get()
        .then(
          (querysnapshot) => querysnapshot.docs.forEach((element) {
            docList.add(element.id);
          }),
        );
    return docList;
  }
}
