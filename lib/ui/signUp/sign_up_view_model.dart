import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/sign_up/sign_up_repository.dart';
import 'package:wru/data/repository/sign_up/sign_up_repository_impl.dart';
import 'package:wru/ui/hooks/use_router.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/signUp/sign_up_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signUpViewModelProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, AsyncValue<SignUpState>>(
  (ref) => SignUpViewModel(ref: ref),
);

final signUpErrorProvider = StateProvider((ref) => '');

class SignUpViewModel extends StateNotifier<AsyncValue<SignUpState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  SignUpViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }

  late final SignUpRepository _repository = _ref.read(signUpRepositoryProvider);
  final router = useRouter();

  //ここの意味がわからない
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
    final initUidNotifier = _ref.read(initUidProvider.notifier);
    final errorNotifier = _ref.read(signUpErrorProvider.notifier);
    final fetchUidNotifier = _ref.read(fetchUidProvider.notifier);
    //取得したAppUser
    final result =
        await _repository.signUp(currentState.email, currentState.password);
    result.when(
      success: (appUser) async {
        if (appUser != null) {
          //ログイン可能な場合の処理
          //uidをプロバイダーでかんりする ローカルに保存
          await initUidNotifier.saveUid(appUser.uid);
          await fetchUidNotifier.fetchUid();
          print(appUser.toString());
        } else {
          state = AsyncValue.data(
            SignUpState(
                email: currentState.email,
                password: currentState.password,
                errorMsg: 'cannot signup'),
          );
        }
      },
      failure: (error) async {
        print('signUp失敗');
        print(error);
        errorNotifier.state = error.toString();
        router.push(const SignUpRoute());
      },
    );
  }
}
