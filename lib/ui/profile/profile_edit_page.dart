import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'profile_page.dart';

final textchangedProvider = StateProvider<bool>((ref) {
  //変化するデータ
  return false;
});

class ProfileEditPage extends HookConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final textchanged = ref.watch(textchangedProvider);

    //プロフィール編集１つ分のWidget
    Widget modelToWidget(ProfileElement model) {
      return Column(children: [
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
            onChanged: (value) {
              ref.read(textchangedProvider.notifier).state =
                  true; //文字が変更されたらtrueにする
            },
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        ),
        // Divider( //線を引くやつ
        //   indent: 30,
        //   endIndent: 30,
        //   thickness: 1,
        // )
      ]);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //この辺を変更するときはprofile_pageも変更する
          title: const Text('プロフィール'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.grey,
            onPressed: () {
              context.popRoute(ref.read(textchangedProvider.notifier).state =
                      false //falseに戻す
                  );
            },
          ),
          backgroundColor: theme.appColors.background,
          elevation: 0,
          actions: textchanged == false
              ? null
              : [
                  TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      //firebaseに保存する処理がここにくる
                      ref.read(textchangedProvider.notifier).state =
                          false; //falseに戻す
                      context.pushRoute(TabRoute());
                    },
                    child: Text(
                      '保存',
                      style: theme.textTheme.h40.copyWith(color: Colors.black),
                    ),
                  )
                ],
        ),
        body: ListView.builder(
          itemCount: models.length,
          itemBuilder: (context, index) => modelToWidget(models[index]),
        ),
      ),
    );
  }
}
