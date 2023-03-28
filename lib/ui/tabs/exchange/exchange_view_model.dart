import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/data/model/sent_card/sent_card.dart';
import 'package:wru/data/repository/exchange/exchange_repository_impl.dart';

//uidを取ってくる#TODO
const tentativeuid = '4MXOY43lcRVTSA8GVq1X8ioCqBf1';

final receivedCardProvider =
    StateNotifierProvider<ReceivedCardNotifier, ReceivedCard>(
        (ref) => ReceivedCardNotifier());

class ReceivedCardNotifier extends StateNotifier<ReceivedCard> {
  ReceivedCardNotifier()
      : super(ReceivedCard(uid: '', documentID: '', card: NameCard()));
  void getReceivedCard(ReceivedCard receivedCard, WidgetRef ref) {
    state = receivedCard;
    print('一旦プロバイダー');
    ref.read(exchangeRepositoryProvider).saveReceivedCard(tentativeuid);
  }

  void changeMemo(String text, WidgetRef ref) {
    //メモを変更したあとfirestoreに保存する必要がある
    state = state.copyWith(memo: text);
    ref.read(exchangeRepositoryProvider).saveReceivedCard(tentativeuid);
  }

  String returnReceivedName() {
    return state.card.name!;
  }
}

class QRCodeNotifier extends StateNotifier<Barcode> {
  QRViewController? controller;
  QRCodeNotifier() : super(Barcode(null, BarcodeFormat.unknown, null));

  //QRコードを読み取ったあとの処理を書く#TODO
  //受け取り画面に遷移と受け取った名刺をfirebaseに保存
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller!.scannedDataStream.listen((scanData) {
      state = scanData;
      // state.codeでデータを取れる
    });
  }
}

final myQrCodeInfoProvider = FutureProvider((ref) async {
  final List docList = await ref
      .read(exchangeRepositoryProvider)
      .fetchMyCardsDocId(tentativeuid);
  final NameCard nameCard = await ref
      .read(exchangeRepositoryProvider)
      .fetchMyNameCard(tentativeuid, docList[0]);
  final SentCard sentCard = SentCard(
      uid: tentativeuid,
      //自分の名刺が今は１個しかないためindexは0
      documentID: docList[0],
      card: nameCard.toJson());
  return sentCard;
});

class ExchangeViewModel {
  String? fetchImageVM(WidgetRef ref) {
    String? imageUrl;
    ref.read(exchangeRepositoryProvider).fetchFaceImage();
    return imageUrl;
  }

  String? fetchFaceImageVM(WidgetRef ref) {
    String? faceImageUrl;
    ref.read(exchangeRepositoryProvider).fetchFaceImage();
    return faceImageUrl;
  }
}
