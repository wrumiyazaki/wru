import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';

final absorbProvider = StateProvider<bool>((ref) => false);

final qrCodeProvider =
    StateNotifierProvider.autoDispose<QRCodeNotifier, Barcode>((ref) {
  final notifier = QRCodeNotifier();
  ref.onDispose(() => notifier.controller?.dispose());
  return notifier;
});
