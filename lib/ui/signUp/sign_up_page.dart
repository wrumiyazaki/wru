import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/hooks/use_router.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/signIn/sign_in_view_model.dart';
import 'package:wru/ui/signUp/sign_up_view_model.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpViewModelProvider);
    final viewModel = ref.watch(signUpViewModelProvider.notifier);
    final router = useRouter();
    final l10n = useL10n();
    final signUpErrorState = ref.watch(signUpErrorProvider);
    final signBoolNotifier = ref.read(signInOrUpProvider.notifier);

    return state.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.signUp),
          ),
          body: Container(
            padding: const EdgeInsets.all(64),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    signUpErrorState,
                    style: const TextStyle(fontSize: 15, color: Colors.red),
                  ),
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
                          child: Text(l10n.signUp),
                          onPressed: () async {
                            try {
                              await viewModel.singUp();
                              //サインアップ成功
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
                  //SignInに遷移する
                  TextButton(
                    onPressed: () {
                      router.push(const SignInRoute());
                      signBoolNotifier.state = true;
                    },
                    child: Text(l10n.toSignIn),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      data.errorMsg,
                      style: const TextStyle(color: Colors.red),
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
