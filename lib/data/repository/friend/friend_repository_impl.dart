import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/friend/friend_repository.dart';
import 'package:wru/ui/tabs/friend/friend_view_model.dart';

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
  Future<void> fetchImage() async {
    final stream = receivedCardRef.snapshots();
    final imgNotifier = _ref.read(imgListProvider.notifier);
    int i = 0;
    stream.listen((event) {
      //event.docsのなかみがなくなるまで１つ１つsnapshotの中に代入して扱える
      //ドキュメントひとつ一つに対してimgUrlを取得する
      for (var snapshot in event.docs) {
        final url = snapshot.data()['imgUrl'];
        imgNotifier.getUrl(i, url);
      }
    });
    return;
  }

//   Future<void> fetchFaceImage();
//   Future<void> fetchMemo();
  // Future<void> saveMemo();
}
