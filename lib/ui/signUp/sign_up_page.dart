import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/signUp/sign_up_view_model.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpViewModelProvider);
    final viewModel = ref.watch(signUpViewModelProvider.notifier);

    return state.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('signUp'),
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
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen),
                          child: const Text('signUp'),
                          onPressed: () async {
                            try {
                              print('signUn');
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
