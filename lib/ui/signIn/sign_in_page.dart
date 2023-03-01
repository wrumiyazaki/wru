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
    final state = ref.watch(signInViewModelProvider);
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
                              backgroundColor: Colors.blue),
                          child: Text(l10n.signIn),
                          onPressed: () async {
                            try {
                              viewModel.signIn();
                            } catch (e) {
                              print(e.toString());
                              return;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => router.pop(),
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
