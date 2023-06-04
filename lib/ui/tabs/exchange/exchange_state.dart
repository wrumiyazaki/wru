import 'package:hooks_riverpod/hooks_riverpod.dart';

final absorbProvider = StateProvider<bool>((ref) => false);

final imageprovider = StateProvider<bool>((ref) => true);

final onCameraProvider = StateProvider<bool>((ref) => false);
