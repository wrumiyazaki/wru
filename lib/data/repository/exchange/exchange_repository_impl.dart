import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/model/app_user/app_user.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/repository/exchange/exchange_repository.dart';

final exchangeRepositoryProvider =
    Provider((ref) => ExchangeRepositoryImpl(ref));

class ExchangeRepositoryImpl implements ExchangeRepository {
  ExchangeRepositoryImpl(this._ref);
  Ref _ref;
  late final FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';
  final myCardsCollection = 'myCards';
  final receivedCardsCollection = 'receivedCards';
  Map nameCardJson = NameCard(name: 'name').toJson();
  //本当はQRから読み取った名刺の情報群(Json? インスタンス? String?) #TODO
  late Map<String, dynamic> receivedNameCardInfo =
      ReceivedCard(uid: 'ooo', documentID: 'aaa', namecard: nameCardJson)
          .toJson();

  @override
  Future<void> saveReceivedCard(String uid) async {
    print(receivedNameCardInfo);
    db
        .collection(usersCollection)
        .doc(uid)
        .collection(receivedCardsCollection)
        .add(receivedNameCardInfo);
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
