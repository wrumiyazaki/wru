import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/hooks/use_router.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/signIn/sign_in_view_model.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //<AsyncValue<SignInState>>を保持するプロバイダー
    final state = ref.watch(signInViewModelProvider);
    //<AsyncValue<SignInState>>の関数を呼び出す
    final viewModel = ref.watch(signInViewModelProvider.notifier);
    final router = useRouter();
    final l10n = useL10n();

    return state.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.signIn),
          ),
          body: Container(
            padding: const EdgeInsets.all(64),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.email),
                    onChanged: (value) => viewModel.updateEmailInputBox(value),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: l10n.password),
                    onChanged: (value) =>
                        viewModel.updatePasswordInputBox(value),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Text(l10n.signIn),
                          onPressed: () async {
                            try {
                              await viewModel.signIn();
                              //ログイン成功
                              router.push(const TabRoute());
                            } catch (e) {
                              print(e.toString());
                              return;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  //SignUpに遷移する
                  TextButton(
                    onPressed: () => router.push(const SignUpRoute()),
                    child: Text(l10n.toSignUp),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      data.errorMsg,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ]),
          ),
        );
      },
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
