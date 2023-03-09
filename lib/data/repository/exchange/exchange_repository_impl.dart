import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/repository/exchange/exchange_repository.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';

final exchangeRepositoryProvider =
    Provider((ref) => ExchangeRepositoryImpl(ref));

class ExchangeRepositoryImpl implements ExchangeRepository {
  ExchangeRepositoryImpl(this._ref);
  Ref _ref;
  late final FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';
  final myCardsCollection = 'myCards';
  final receivedCardsCollection = 'receivedCards';
  NameCard nameCardJson = NameCard(name: 'name');
  final receivedCardProvider =
      StateNotifierProvider<ReceivedCardNotifier, ReceivedCard>(
          (ref) => ReceivedCardNotifier());

  @override
  Future<void> saveReceivedCard(String uid) async {
    final receivedCardRef = db
        .collection(usersCollection)
        .doc(uid)
        .collection(receivedCardsCollection)
        .doc();
    receivedCardRef.set(_ref.watch(receivedCardProvider).toJson());
  }

  Future saveMemo() async {}

  Future<String> fetchImages() async {
    return 'a';
  }

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

// Result.guardFuture(() {
// return Result.success(data: 0);
// });
