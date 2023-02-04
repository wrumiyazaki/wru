import 'dart:math';

import 'package:wru/data/model/result/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'xxx_repository.dart';

final xxxRepositoryProvider =
    Provider<XXXRepository>((ref) => XXXRepositoryImpl(ref));

class XXXRepositoryImpl implements XXXRepository {
  XXXRepositoryImpl(this.ref);
  final Ref ref;

  @override
  Future<Result<int>> fetch() async {
    return Result.guardFuture(() async {
      await Future.delayed(const Duration(seconds: 2));

      final rand = Random();
      return rand.nextInt(100);
    });
  }
}
