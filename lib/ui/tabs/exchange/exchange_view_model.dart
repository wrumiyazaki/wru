import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/data/model/sent_card/sent_card.dart';
import 'package:wru/data/repository/exchange/exchange_repository_impl.dart';

//uidを取ってくる#TODO
const tentativeuid = '4MXOY43lcRVTSA8GVq1X8ioCqBf1';

class ReceivedCardNotifier extends StateNotifier<ReceivedCard> {
  ReceivedCardNotifier()
      : super(ReceivedCard(uid: '', documentID: '', card: NameCard()));
  void getReceivedCard(ReceivedCard receivedCard) {
    state = receivedCard;
  }

  void changeMemo(String text) {
    state = state.copyWith(memo: text);
    //メモを変更したあとfirestoreに保存する必要がある
    Provider(
      (ref) {
        ref.read(exchangeRepositoryProvider).saveReceivedCard(tentativeuid);
      },
    );
  }
}

class QRCodeNotifier extends StateNotifier<Barcode> {
  QRViewController? controller;
  QRCodeNotifier() : super(Barcode(null, BarcodeFormat.unknown, null));
  final receivedProvider =
      StateNotifierProvider((ref) => ReceivedCardNotifier());

  //QRコードを読み取ったあとの処理を書く#TODO
  //受け取り画面に遷移と受け取った名刺をfirebaseに保存
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller!.scannedDataStream.listen((scanData) {
      state = scanData;
      // state.codeでデータを取れる
      //スキャンしたデータを仮で再現する
      NameCard tentativenameCard =
          NameCard(name: 'name', imgUrl: 'ss', faceImgUrl: 'ss');
      //tentativeReceivedNameCardInfoがstate.codeの代替
      late String tentativeReceivedNameCardInfo = jsonEncode(
          SentCard(uid: 'ooo', documentID: 'aaa', card: tentativenameCard));
      //受け取ったjsonをRecivedCardに当てはめる
      final ReceivedCard tentativeReceivedCard =
          jsonDecode(tentativeReceivedNameCardInfo);
      Provider(
        (ref) {
          ref
              .read(receivedProvider.notifier)
              //受け取った情報をプロバイダーで扱えるようになる
              .getReceivedCard(tentativeReceivedCard);
          ref
              .read(exchangeRepositoryProvider)
              //保存する
              .saveReceivedCard(tentativeuid);
        },
      );
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
      card: nameCard);
  return sentCard;
});

class ExchangeViewModel {
  String? fetchImageVM() {
    String? imageUrl;
    Provider(
      (ref) async {
        imageUrl = await ref.read(exchangeRepositoryProvider).fetchImage();
      },
    );
    return imageUrl;
  }

  String? fetchFaceImageVM() {
    String? faceImageUrl;
    Provider(
      (ref) async {
        faceImageUrl =
            await ref.read(exchangeRepositoryProvider).fetchFaceImage();
      },
    );
    return faceImageUrl;
  }
}
