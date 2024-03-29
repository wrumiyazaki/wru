import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/exchange/receive_repostitory.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';

final receiveRepositoryProvider = Provider((ref) => ReceiveRepositoryImpl(ref));

class ReceiveRepositoryImpl implements ReceiveRepository {
  ReceiveRepositoryImpl(this._ref);

  final Ref _ref;
  late final uid = _ref.watch(uidProvider);
  late FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  late final provider = _ref.watch(receivedCardProvider);
  final usersCollection = 'users';
  final myCardsCollection = 'myCards';
  final receivedCardsCollection = 'receivedCards';

  //自動生成された同じドキュメントを扱う
  late final receivedCardRef = db
      .collection(usersCollection)
      .doc(uid)
      .collection(receivedCardsCollection)
      .doc();

  //ReceivedCardをfirestoreに保存
  @override
  Future<void> save() async {
    await receivedCardRef.set(provider);
    print('セーブ');
  }
}
