import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/provider/firebase_storage_provider.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/create_card/create_card_repository.dart';
import 'package:wru/ui/create_card/create_card_view_model.dart';

final createCardRepositoryProvider =
    AutoDisposeProvider((ref) => CreateCardRepositoryImpl(ref));

class CreateCardRepositoryImpl implements CreateCardRepository {
  CreateCardRepositoryImpl(this._ref);

  final Ref _ref;
  late FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';
  final myCardsCollection = 'myCards';
  final List docList = [];
  late final uid = _ref.watch(uidProvider);
  late final myCardRef =
      db.collection(usersCollection).doc(uid).collection(myCardsCollection);
  late final createCardState = _ref.watch(createCardViewModelProvider);
  late Map<String, dynamic> map;

  @override
  Future<void> save(Map<String, dynamic> map, Uint8List list) async {
    myCardRef.get().then((snapshot) {
      //myCardsコレクションに入っているドキュメントのidを取得
      snapshot.docs.forEach(
        (doc) {
          docList.add(doc.id);
        },
      );
      //いままでにつくった名刺がない場合はドキュメントIDをつくって保存
      if (docList[0] != null) {
        myCardRef.doc().set(map);
      }
      //作成済みの場合は上書きする
      else {
        myCardRef.doc(docList[1]).set(map);
      }
    });
  }

  Future<void> saveAndFetchStorageUrl(Uint8List uint8) async {
    final storageRef = _ref.watch(storageRefProvider);
    //uidが必要
    final uid = _ref.watch(uidProvider);
    final mountainsRef = storageRef.child("users/$uid/myCard.jpg");
    try {
      await mountainsRef.putData(uint8);
    } on FirebaseException catch (e) {
      print("Failed with error '${e.code}': ${e.message}");
    }
  }
}
