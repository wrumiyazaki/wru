import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/ui/tabs/exchange/exchange_view_model.dart';

final absorbProvider = StateProvider<bool>((ref) => false);

final imageprovider = StateProvider<bool>((ref) => true);

final onCameraProvider = StateProvider<bool>((ref) => false);
