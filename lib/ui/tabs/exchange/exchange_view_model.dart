import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeNotifier extends StateNotifier<Barcode> {
  QRViewController? controller;
  QRCodeNotifier() : super(Barcode(null, BarcodeFormat.unknown, null));

  //QRコードを読み取ったあとの処理を書く
  //受け取り画面に遷移と受け取った名刺をfirebaseに保存
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller!.scannedDataStream.listen((scanData) {
      state = scanData;
    });
  }
}

class ExchangeViewModel extends StatelessWidget {
  const ExchangeViewModel({super.key});

  String myQrCode() {
    //firebaseから取得した
    return 'myCardID';
  }

  String myName() {
    String cardid = myQrCode();
    //cardIDを使って名刺の中に書いてある名前を取得してそれを返す
    return '小林';
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
