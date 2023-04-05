import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/data/model/sent_card/sent_card.dart';
import 'package:wru/data/repository/exchange/receive_repository_impl.dart';
import 'package:wru/data/repository/exchange/sent_repository_impl.dart';

//uidをとってくる #TODO
String tentativeUid = '4MXOY43lcRVTSA8GVq1X8ioCqBf1';

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
  final List docList =
      await ref.read(sentRepositoryProvider).fetchMyCardsDocId(tentativeUid);
  final NameCard nameCard = await ref
      .read(sentRepositoryProvider)
      .fetchMyNameCard(tentativeUid, docList[0]);
  final SentCard sentCard = SentCard(
      uid: tentativeUid,
      //自分の名刺が今は１個しかないためindexは0
      documentID: docList[0],
      card: nameCard.toJson());
  return sentCard;
});

//受け取った名刺
final receivedCardProvider =
    StateNotifierProvider<ReceivedCardNotifier, ReceivedCard?>(
        (ref) => ReceivedCardNotifier(ref));

class ReceivedCardNotifier extends StateNotifier<ReceivedCard> {
  ReceivedCardNotifier(this._ref)
      : super(ReceivedCard(uid: '', documentID: '', card: {}));
  final Ref _ref;

  void saveReceivedCard(String json) {
    transJsonToReceivedCard(json);
    saveFirestore();
  }

  void saveMemo(String st) {
    state = state!.copyWith(memo: st);
    saveFirestore();
  }

  //受け取ったjsonをMapに変換し、providerで監視
  void transJsonToReceivedCard(String st) {
    Map<String, dynamic> receivedMap = jsonDecode(st);
    ReceivedCard receivedCard = ReceivedCard.fromJson(receivedMap);
    state = receivedCard;
  }

  void saveFirestore() {
    _ref.read(receiveRepositoryProvider).save();
  }
}
