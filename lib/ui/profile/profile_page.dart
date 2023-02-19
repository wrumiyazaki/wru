import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/profile/profile_edit_page.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';

class ProfileElement {
  final String name;
  final String text;

  //コンストラクタ
  const ProfileElement(
    this.name,
    this.text,
  );
}

final models = [
  //変更されたら反映させてあげないといけない
  //firebaseから呼び出す 再レンダリング？ 再呼び出し？
  ProfileElement('名前', '小林 ゆうひ'),
  ProfileElement('読み方', 'こばやし ユウヒ'),
  ProfileElement('ユーザーID', '3902189475234'),
  ProfileElement('生年月日', '7/22'),
  ProfileElement('電話番号', '9008098800'),
  ProfileElement('メールアドレス', 'aaafas@fdasf.afas'),
  ProfileElement('性別', 'aaa'),
  ProfileElement('所属１', 'aaaaaaaaaaa'),
  ProfileElement('所属２', 'aaaaaaaaaaa'),
  ProfileElement('所属３', 'aaaaaaaa'),
  ProfileElement('追加？', 'aaa'),
  ProfileElement('追加？', 'aaa'),
  ProfileElement('追加？', 'aaa'),
];

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    //プロフィール１つ分のWidget
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
          child: Text(
            model.text,
            style: theme.textTheme.h40,
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
          //この辺を変更するときはprofile_edit_pageも変更しないといけないかも
          title: const Text('プロフィール'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.grey,
            onPressed: () {
              context.popRoute();
            },
          ),
          backgroundColor: theme.appColors.background,
          elevation: 0,
          actions: [
            TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {
                context.router.push(ProfileEditRoute());
              },
              child: Text(
                '編集',
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
