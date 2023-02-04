import 'package:flutter_study_mvvm/data/repository/xxx/xxx_repository.dart';
import 'package:flutter_study_mvvm/data/repository/xxx/xxx_repository_impl.dart';
import 'package:flutter_study_mvvm/ui/xxx/xxx_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final xxxViewModelProvider =
    StateNotifierProvider.autoDispose<XXXViewModel, AsyncValue<XXXState>>(
  (ref) => XXXViewModel(ref: ref),
);

class XXXViewModel extends StateNotifier<AsyncValue<XXXState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  XXXViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  late final XXXRepository xxxRepository = _ref.read(xxxRepositoryProvider);

  Future<void> load() async {
    final result = await xxxRepository.fetch();
    result.when(success: (data) {
      state = AsyncValue.data(
        XXXState(count: data),
      );
    }, failure: (error) {
      state = AsyncValue.error(error, StackTrace.current);
    });
  }

  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(
      XXXState(count: count + 1),
    );
  }
}
