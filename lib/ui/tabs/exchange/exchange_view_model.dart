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
final myQrInfoProvider =
    StateNotifierProvider<MyQrInfoNotifier, AsyncValue<Map>>(
        (ref) => MyQrInfoNotifier(ref));

class MyQrInfoNotifier extends StateNotifier<AsyncValue<Map>> {
  MyQrInfoNotifier(this._ref) : super(const AsyncLoading()) {
    fetchMyQrInfo();
  }
  final Ref _ref;
  Future<void> fetchMyQrInfo() async {
    final uid = _ref.watch(uidProvider);
    final List docList =
        await _ref.read(sentRepositoryProvider).fetchMyCardsDocId(uid);
    Map? myMap;
    if (docList.isNotEmpty) {
      myMap = await _ref
          .read(sentRepositoryProvider)
          .fetchMyNameCard(uid, docList[0]);
    }
    if (myMap == null) {
      state = const AsyncData({});
      return;
    }
    Map sentMap = {
      "uid": uid,
      "documentID": docList[0],
      "imgUrl": myMap['imgUrl'],
      "faceImgUrl": myMap['faceImgUrl'],
      "infoList": myMap['infoList'],
      "memo": '',
    };
    state = AsyncData(sentMap);
  }
}

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
