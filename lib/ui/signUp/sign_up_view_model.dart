import 'package:wru/ui/signUp/sign_up_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signUpViewModelProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, AsyncValue<SignUpState>>(
  (ref) => SignUpViewModel(ref: ref),
);

class SignUpViewModel extends StateNotifier<AsyncValue<SignUpState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  SignUpViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.data(
      SignUpState(),
    );
  }

  void updateEmailInputBox(email) {
    SignUpState currentState = state.value!;
    state = AsyncValue.data(
      SignUpState(email: email, password: currentState.password),
    );
  }

  void updatePasswordInputBox(password) {
    SignUpState currentState = state.value!;
    state = AsyncValue.data(
      SignUpState(email: currentState.email, password: password),
    );
  }
}
