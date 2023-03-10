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
  final receivedCardProvider =
      StateNotifierProvider<ReceivedCardNotifier, ReceivedCard>(
          (ref) => ReceivedCardNotifier());

  //自動生成された同じドキュメントを扱う
  late final receivedCardRef = db
      .collection(usersCollection)
      .doc(tentativeuid)
      .collection(receivedCardsCollection)
      .doc();

  @override
  Future<void> saveReceivedCard(String uid) async {
    receivedCardRef.set(_ref.watch(receivedCardProvider).toJson());
  }

  Future saveMemo() async {}

  @override
  Future<String?> fetchImage() async {
    String? imgUrl;
    receivedCardRef.get().then(
      (value) async {
        imgUrl = await value.data()!['namecard']['imgUrl'];
      },
    );
    return imgUrl;
  }

  @override
  Future<String?> fetchFaceImage() async {
    String? faceImgUrl;
    receivedCardRef.get().then(
      (value) async {
        faceImgUrl = await value.data()!['namecard']['faceImgUrl'];
      },
    );
    return faceImgUrl;
  }

  @override
  Future<String?> fetchReceivedUid() async {
    String? imgUrl;
    receivedCardRef.get().then(
      (value) async {
        imgUrl = await value.data()!['uid'];
      },
    );
    return imgUrl;
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
