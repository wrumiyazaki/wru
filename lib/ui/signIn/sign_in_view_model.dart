import 'package:wru/data/repository/sign_in/sign_in_repository.dart';
import 'package:wru/data/repository/sign_in/sign_in_repository_impl.dart';
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

  late final SignInRepository _repository = _ref.read(signInRepositoryProvider);

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

  Future<void> signIn() async {
    SignInState currentState = state.value!;
    final result =
        await _repository.signIn(currentState.email, currentState.password);
    result.when(
      success: (appUser) {
        if (appUser != null) {
          print(appUser.email);
        } else {
          state = AsyncValue.data(
            SignInState(
                email: currentState.email,
                password: currentState.password,
                errorMsg: 'cannot signin'),
          );
        }
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}
