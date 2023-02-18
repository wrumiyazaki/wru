import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SignIn"),
        ),
        body: Container(
          padding: const EdgeInsets.all(64),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'email'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'password(6文字以上)'),
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
                        child: const Text('Sigin In'),
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
        ));
  }
}
