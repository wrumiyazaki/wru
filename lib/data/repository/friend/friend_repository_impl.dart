import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/friend/friend_repository.dart';
import 'package:wru/ui/tabs/friend/friend_view_model.dart';

final friendRepositoryProvider = Provider((ref) => FriendRepositoryImpl(ref));

class FriendRepositoryImpl implements FriendRepository {
  FriendRepositoryImpl(this._ref);

  final Ref _ref;
  late FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';
  final receivedCardsCollection = 'receivedCards';
  late final uid = _ref.watch(uidProvider);
  late final receivedCardRef = db
      .collection(usersCollection)
      .doc(uid)
      .collection(receivedCardsCollection);

  @override
  Future<void> fetch() async {
    final stream = receivedCardRef.snapshots();
    final imgNotifier = _ref.read(imgListProvider.notifier);
    final faceImgNotifier = _ref.read(faceImgListProvider.notifier);
    final memoNotifier = _ref.read(memoListProvider.notifier);
    final lengthNotifier = _ref.read(friendListLengthProvider.notifier);
    stream.listen((event) async {
      //event.docsのなかみがなくなるまで１つ１つsnapshotの中に代入して扱える
      //ドキュメントひとつ一つに対してimgUrlを取得する
      lengthNotifier.state = event.docs.length;
      for (var snapshot in event.docs) {
        final imgUrl = await snapshot.data()['imgUrl'];
        String? faceImgUrl;
        //空文字をいれておく
        String memo = '';
        //ない場合はnullが入る
        if (snapshot.data()['faceImgUrl'] != null) {
          faceImgUrl = snapshot.data()['faceImgUrl'];
        }
        if (snapshot.data()['memo'] != null) {
          memo = snapshot.data()['memo'];
        }
        imgNotifier.getUrl(imgUrl);
        faceImgNotifier.getUrl(faceImgUrl);
        memoNotifier.getUrl(memo);
      }
    });
    return;
  }

  @override
  Future<void> saveMemo(int index, String? memo) async {
    final snapshot = await receivedCardRef.get();
    final docId = snapshot.docs[index].id;
    receivedCardRef.doc(docId).update({"memo": memo});
  }
}
