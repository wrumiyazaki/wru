import 'package:wru/data/repository/sign_up/sign_up_repository.dart';
import 'package:wru/data/repository/sign_up/sign_up_repository_impl.dart';
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

  late final SignUpRepository _repository = _ref.read(signUpRepositoryProvider);

  Future<void> load() async {
    state = const AsyncValue.data(
      SignUpState(),
    );
  }

  void updateEmailInputBox(email) {
    state = AsyncValue.data(state.value!.copyWith(email: email));
  }

  void updatePasswordInputBox(password) {
    state = AsyncValue.data(state.value!.copyWith(password: password));
  }

  Future<void> singUp() async {
    SignUpState currentState = state.value!;
    final result =
        await _repository.signUp(currentState.email, currentState.password);
    result.when(
      success: (appUser) {
        if (appUser != null) {
          print(appUser.email);
        } else {
          state = AsyncValue.data(
            SignUpState(
                email: currentState.email,
                password: currentState.password,
                errorMsg: 'cannot signup'),
          );
        }
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}
