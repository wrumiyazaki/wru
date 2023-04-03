import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/sent_card/sent_card.dart';
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

  //受け取り画面に遷移と受け取った名刺をfirebaseに保存
  // void onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   this.controller!.scannedDataStream.listen((scanData) {
  //     state = scanData;
  //   });
  // }
}

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

class ExchangeViewModel extends StatelessWidget {
  ExchangeViewModel({super.key});

  String yourName(String cardid) {
    //cardIDを使って名刺の中に書いてある名前を取得してそれを返す
    return '小林';
  }

  void memoSave(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
