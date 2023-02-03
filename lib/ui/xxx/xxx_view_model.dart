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

  void load() {
    state = const AsyncValue.data(
      XXXState(count: 0),
    );
  }

  void increment() {
    final count = state.value!.count;
    state = AsyncValue.data(
      XXXState(count: count + 1),
    );
  }
}
