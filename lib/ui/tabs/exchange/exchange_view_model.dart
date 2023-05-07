import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/exchange/receive_repository_impl.dart';
import 'package:wru/data/repository/exchange/sent_repository_impl.dart';

final qrCodeProvider =
    StateNotifierProvider.autoDispose<QRCodeNotifier, Barcode>((ref) {
  final notifier = QRCodeNotifier();
  ref.onDispose(() => notifier.controller?.dispose());
  return notifier;
});

class QRCodeNotifier extends StateNotifier<Barcode> {
  QRViewController? controller;
  QRCodeNotifier() : super(Barcode(null, BarcodeFormat.unknown, null));
}

//取得してきた自分の名刺
final myQrInfoProvider = FutureProvider((ref) async {
  final uid = ref.watch(uidProvider);
  final List docList =
      await ref.read(sentRepositoryProvider).fetchMyCardsDocId(uid);

  Map? myMap;
  if (docList.isNotEmpty) {
    myMap =
        await ref.read(sentRepositoryProvider).fetchMyNameCard(uid, docList[0]);
  }
  if (myMap == null) {
    return null;
  }
  Map sentMap = {
    "uid": uid,
    "documentID": docList[0],
    "imgUrl": myMap['imgUrl'],
    "faceImgUrl": myMap['faceImgUrl'],
    "infoList": myMap['infoList'],
    "memo": '',
  };
  return sentMap;
  // final SentCard sentCard = SentCard(
  //     uid: uid,
  //     //自分の名刺が今は１個しかないためindexは0
  //     documentID: docList[0],
  //     card: nameCard.toJson());
  // return sentCard;
});

// //受け取った名刺
// final receivedCardProvider =
//     StateNotifierProvider<ReceivedCardNotifier, ReceivedCard?>(
//         (ref) => ReceivedCardNotifier(ref));

// class ReceivedCardNotifier extends StateNotifier<ReceivedCard> {
//   ReceivedCardNotifier(this._ref)
//       : super(ReceivedCard(uid: '', documentID: '', card: {}));
//   final Ref _ref;

//   void saveReceivedCard(String json) {
//     transJsonToReceivedCard(json);
//     saveFirestore();
//   }

//   void saveMemo(String st) {
//     state = state.copyWith(memo: st);
//     saveFirestore();
//   }

//   //受け取ったjsonをMapに変換し、providerで監視
//   void transJsonToReceivedCard(String st) {
//     Map<String, dynamic> receivedMap = jsonDecode(st);
//     ReceivedCard receivedCard = ReceivedCard.fromJson(receivedMap);
//     state = receivedCard;
//   }

//   void saveFirestore() {
//     _ref.read(receiveRepositoryProvider).save();
//   }
// }

//受け取った名刺
final receivedCardProvider =
    StateNotifierProvider<ReceivedCardNotifier, Map<String, dynamic>>(
        (ref) => ReceivedCardNotifier(ref));

class ReceivedCardNotifier extends StateNotifier<Map<String, dynamic>> {
  ReceivedCardNotifier(this._ref) : super({});
  final Ref _ref;

  //読み取ったjsonをmapに戻してfirestoreに保存
  Future<void> saveReceivedCard(String json) async {
    Map<String, dynamic> receivedMap = jsonDecode(json);
    state = receivedMap;
    await _ref.read(receiveRepositoryProvider).save();
  }

  Future<void> saveMemo(String st) async {
    state['memo'] = st;
    await _ref.read(receiveRepositoryProvider).save();
  }
}
