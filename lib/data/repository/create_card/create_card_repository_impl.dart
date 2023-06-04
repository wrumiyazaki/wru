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
  Future<void> save(String docId, Map<String, dynamic> map) async {
    myCardRef.doc(docId).set(map);
  }

  @override
  Future<String> saveAndFetchStorageUrl(Uint8List uint8, String docId) async {
    final storageRef = _ref.watch(storageRefProvider);
    //uidが必要
    final uid = _ref.watch(uidProvider);
    final mountainsRef = storageRef.child("users/$uid/$docId");
    //画像をアップロード
    try {
      await mountainsRef.putData(uint8);
    } on FirebaseException catch (e) {
      print("Failed with error '${e.code}': ${e.message}");
    }
    //urlを取得
    final downloadUrl = await mountainsRef.getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<String> fetchDocId() async {
    final fbProvider = _ref.watch(firebaseFirestoreProvider);
    String docId = '';
    final snapshot = await myCardRef.get();
    //つくられたことがなくドキュメントがない場合
    if (snapshot.docs.isEmpty) {
      docId = myCardRef.doc().id;
    } else {
      final doc = snapshot.docs[0];
      docId = doc.id;
    }
    return docId;
  }
}
