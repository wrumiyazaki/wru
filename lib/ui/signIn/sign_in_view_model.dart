import 'package:wru/ui/signIn/sign_in_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signInViewModelProvider =
    StateNotifierProvider.autoDispose<SignInViewModel, AsyncValue<SignInState>>(
  (ref) => SignInViewModel(ref: ref),
);

class SignInViewModel extends StateNotifier<AsyncValue<SignInState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  SignInViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.data(
      SignInState(),
    );
  }

  void updateEmailInputBox(email) {
    SignInState currentState = state.value!;
    state = AsyncValue.data(
      SignInState(email: email, password: currentState.password),
    );
  }

  void updatePasswordInputBox(password) {
    SignInState currentState = state.value!;
    state = AsyncValue.data(
      SignInState(email: currentState.email, password: password),
    );
  }
}
