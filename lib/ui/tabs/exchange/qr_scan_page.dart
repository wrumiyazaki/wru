import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/sent_card/sent_card.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/theme/app_theme.dart';

class QrScanPage extends HookConsumerWidget {
  QrScanPage({super.key});
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final absorb = ref.watch(absorbProvider);
    final absorbnotifier = ref.watch(absorbProvider.notifier);
    final controllerstate = ref.watch(qrCodeProvider);
    final controllernotifier = ref.watch(qrCodeProvider.notifier);
    final double scanArea = (MediaQuery.of(context).size.width < 300 ||
            MediaQuery.of(context).size.height < 300)
        ? 150.0
        : 300;
    QRViewController controller;

    //スキャンしたデータを仮で再現する #TODO
    NameCard tentativenameCard =
        NameCard(name: 'name', imgUrl: 'ss', faceImgUrl: 'ss');
    //tentativeReceivedNameCardInfoがinfoの代替
    String tentativeReceivedNameCardInfo = jsonEncode(SentCard(
        uid: 'ooo', documentID: 'aaa', card: tentativenameCard.toJson()));

    return AbsorbPointer(
      //childのWidgetの操作を受け付けるか
      absorbing: absorb,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: controllernotifier.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.grey,
                  borderRadius: 20,
                  borderLength: 70,
                  borderWidth: 20,
                  cutOutSize: scanArea),
              onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
            ),
          ),
          Align(
            alignment: Alignment(-0.6, 0.6),
            child: IconButton(
              icon: Icon(
                Icons.qr_code_2,
                size: 70,
                color: theme.appColors.qrCanPress,
              ),
              onPressed: () async {
                absorbnotifier.state = true;
                context.router.push(const QrDisplayRoute());
                controllernotifier.controller!.pauseCamera();
                await Future.delayed(Duration(milliseconds: 300));
                absorbnotifier.state = false;
              },
            ),
          ),
          Align(
            child: VerticalDivider(
              indent: 570,
              endIndent: 70,
              color: theme.appColors.qrCanPress,
            ),
          ),
          Align(
            alignment: Alignment(-0.6, 0.8),
            child: TextButton(
              onPressed: () async {
                absorbnotifier.state = true;
                context.router.push(const QrDisplayRoute());
                controllernotifier.controller!.pauseCamera();
                await Future.delayed(Duration(milliseconds: 300));
                absorbnotifier.state = false;
              },
              child: Text(
                l10n.displayQr,
                style: theme.textTheme.h40
                    .copyWith(color: theme.appColors.qrCanPress),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.35, 0.6),
            child: IconButton(
              icon: Icon(
                Icons.filter_center_focus,
                color: theme.appColors.qrCanNotPress,
                size: 70,
              ),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment(0.5, 0.8),
            child: TextButton(
              onPressed: () {},
              child: Text(
                l10n.scan,
                style: theme.textTheme.h40
                    .copyWith(color: theme.appColors.qrCanNotPress),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            //名刺受け取り画面へ遷移するための仮のボタン
            //実際は読み込まれたら遷移する
            child: FloatingActionButton(
              onPressed: () {
                controllernotifier.controller!.pauseCamera();
                controllernotifier.onQRViewCreated;
                //情報を渡す
                context.router.push(ReceivedInterfaceRoute(
                    info: tentativeReceivedNameCardInfo));
              },
            ),
          )
        ],
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    debugPrint('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
