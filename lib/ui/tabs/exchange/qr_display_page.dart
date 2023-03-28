import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class QrDisplayPage extends HookConsumerWidget {
  const QrDisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final absorb = ref.watch(absorbProvider);
    final absorbnotifier = ref.watch(absorbProvider.notifier);
    final controllernotifier = ref.watch(qrCodeProvider.notifier);
    final onCamerastate = ref.watch(onCameraProvider);
    final onCameranotifier = ref.read(onCameraProvider.notifier);
    final myQrInfo = ref.watch(myQrCodeInfoProvider);

    return Container(
      color: theme.appColors.exchangeBackground,
      padding: const EdgeInsets.all(8.0),
      child: AbsorbPointer(
        //childのWidgetの操作を受け付けるか
        absorbing: absorb,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment(0, -0.5),
              child: RotatedBox(
                  quarterTurns: 2,
                  child: myQrInfo.when(
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => Text('Error: $error'),
                    data: (info) {
                      return Text(
                        '${info.card['name']}の名刺です',
                        style: theme.textTheme.h60
                            .copyWith(color: theme.appColors.qrCode),
                      );
                    },
                  )),
            ),
            Align(
                child: myQrInfo.when(
              loading: () {},
              error: (error, stack) => Text('Error: $error'),
              data: (info) {
                return QrImage(
                  data: jsonEncode(info.toJson()),
                  version: QrVersions.auto,
                  size: 250,
                  foregroundColor: theme.appColors.qrCode,
                );
              },
            )),
            Align(
              alignment: Alignment(-0.6, 0.6),
              child: IconButton(
                icon: Icon(
                  Icons.qr_code_2,
                  size: 70,
                  color: theme.appColors.qrCanNotPress,
                ),
                onPressed: () {},
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
                onPressed: () {},
                child: Text(
                  l10n.displayQr,
                  style: theme.textTheme.h40
                      .copyWith(color: theme.appColors.qrCanNotPress),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.35, 0.6),
              child: IconButton(
                icon: Icon(
                  Icons.filter_center_focus,
                  color: theme.appColors.qrCanPress,
                  size: 70,
                ),
                onPressed: () async {
                  absorbnotifier.state = true;
                  context.router.push(QrScanRoute());
                  if (onCamerastate == true) {
                    controllernotifier.controller!.resumeCamera();
                  }
                  onCameranotifier.state = false;
                  await Future.delayed(Duration(milliseconds: 300));
                  absorbnotifier.state = false;
                },
              ),
            ),
            Align(
              alignment: Alignment(0.5, 0.8),
              child: TextButton(
                onPressed: () async {
                  absorbnotifier.state = true;
                  context.router.push(QrScanRoute());
                  if (onCamerastate == true) {
                    controllernotifier.controller!.resumeCamera();
                  }
                  onCameranotifier.state = false;
                  await Future.delayed(Duration(milliseconds: 300));
                  absorbnotifier.state = false;
                },
                child: Text(
                  l10n.scan,
                  style: theme.textTheme.h40
                      .copyWith(color: theme.appColors.qrCanPress),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
