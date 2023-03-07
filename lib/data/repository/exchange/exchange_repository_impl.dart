import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/model/app_user/app_user.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/repository/exchange/exchange_repository.dart';

final exchangeRepositoryProvider =
    Provider((ref) => ExchangeRepositoryImpl(ref));

class ExchangeRepositoryImpl implements ExchangeRepository {
  ExchangeRepositoryImpl(this._ref);
  Ref _ref;
  late final FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';
  final receivedCardsCollection = 'receivedCards';
  //本当はQRから読み取った名刺の情報群(Json? インスタンス? String?)
  late NameCard recivedNameCard = NameCard(
      name: 'aa',
      university: 'miyadai',
      text: 'sample',
      imgUrl: 'https',
      faceImgUrl: 'faceUrl');

  @override
  Future<void> saveNameCard(String uid) async {
    db
        .collection(usersCollection)
        .doc(uid)
        .collection(receivedCardsCollection)
        .add(recivedNameCard.toJson());
  }

  Future saveMemo() async {}

  Future<String> fetchImages() async {
    return 'a';
  }

  Future<String> fetchMyNameCard() async {
    return 'b';
  }
}

// Result.guardFuture(() {
// return Result.success(data: 0);
// });
