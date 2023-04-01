import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
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
      : super(ReceivedCard(uid: '', documentID: '', card: NameCard().toJson()));
  void getReceivedCard(ReceivedCard receivedCard, WidgetRef ref) {
    state = receivedCard;
    ref.read(exchangeRepositoryProvider).saveReceivedCard(tentativeuid);
  }

  void changeMemo(String text, WidgetRef ref) {
    //メモを変更したあとfirestoreに保存する必要がある
    state = state.copyWith(memo: text);
    ref.read(exchangeRepositoryProvider).saveReceivedCard(tentativeuid);
  }
}

//カメラのコントローラー
final cameraControllerProvider =
    StateNotifierProvider<CameraControllerNotifier, MobileScannerController>(
        (ref) => CameraControllerNotifier());

class CameraControllerNotifier extends StateNotifier<MobileScannerController> {
  CameraControllerNotifier()
      : super(MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
        ));
  void startCamera() {
    state.start();
  }

  void stopCamera() {
    state.stop();
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
