import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'profile_page.dart';

class ProfileEditPage extends HookConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    //プロフィール編集１つ分のWidget
    Widget modelToWidget(ProfileElement model) {
      return Container(
        child: Column(children: [
          Container(
            child: Text(
              model.name,
              style: theme.textTheme.h20.copyWith(color: Colors.grey.shade700),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(30, 20, 0, 5),
          ),
          Container(
            child: TextFormField(
              style: theme.textTheme.h40,
              controller: TextEditingController(text: model.text),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          ),
          // Divider( //線を引くやつ
          //   indent: 30,
          //   endIndent: 30,
          //   thickness: 1,
          // )
        ]),
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) => modelToWidget(models[index]),
      ),
    );
  }
}
