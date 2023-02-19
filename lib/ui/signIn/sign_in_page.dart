import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    return state.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('signIn'),
          ),
          body: Container(
            padding: const EdgeInsets.all(64),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'email'),
                    onChanged: (value) => viewModel.updateEmailInputBox(value),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'password'),
                    onChanged: (value) =>
                        viewModel.updatePasswordInputBox(value),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => router.push(const SignUpRoute()),
                        child: const Text('toSignUp'),
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text('signIn'),
                          onPressed: () async {
                            try {
                              print('signIn');
                            } catch (e) {
                              print(e.toString());
                              return;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'error message',
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
