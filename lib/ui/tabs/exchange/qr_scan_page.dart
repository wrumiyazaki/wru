import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/exchange/exchange_state.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';

class QrScanPage extends HookConsumerWidget {
  QrScanPage({super.key});
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final absorb = ref.watch(absorbProvider);
    final absorbnotifier = ref.watch(absorbProvider.notifier);
    final controllerstate = ref.watch(qrCodeProvider);
    final controllernotifier = ref.watch(qrCodeProvider.notifier);
    final double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: AbsorbPointer(
        //childのWidgetの操作を受け付けるか
        absorbing: absorb,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: controllernotifier.onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea),
                onPermissionSet: (ctrl, p) =>
                    _onPermissionSet(context, ctrl, p),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  absorbnotifier.state = true;
                  context.router.push(const QrDisplayRoute());
                  await Future.delayed(Duration(milliseconds: 300));
                  absorbnotifier.state = false;
                },
                child: Text('Scan')),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (controllerstate.format != BarcodeFormat.unknown)
                  Text(
                      'Barcode Type: ${controllerstate.format}   Data: ${controllerstate.code}')
                else
                  const Text('Scan a code'),
              ],
            ),
          ],
        ),
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
