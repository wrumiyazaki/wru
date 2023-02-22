import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/profile/profile_view_model.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'profile_page.dart';

class ProfileEditPage extends HookConsumerWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    //プロフィール編集１つ分のWidget
    Widget modelToWidget(index, mapkey) {
      return Container(
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(30, 20, 0, 5),
            child: Text(
              profilePropList[index],
              style: theme.textTheme.h20.copyWith(color: Colors.grey.shade700),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: TextFormField(
              style: theme.textTheme.h40,
              controller: TextEditingController(text: getMap[mapkey]),
              onChanged: (value) {
                getMap[mapkey] = value;
              },
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        //この辺を変更するときはprofile_pageも変更する
        title: Text(l10n.profileEdit),
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
              // firebaseに保存する処理がここにくる
              context.pushRoute(TabRoute());
            },
            child: Text(
              '保存',
              style: theme.textTheme.h40.copyWith(color: Colors.black),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          modelToWidget(0, MapKey().name),
          modelToWidget(1, MapKey().namePhonetic),
          modelToWidget(2, MapKey().userID),
          modelToWidget(3, MapKey().birthday),
          modelToWidget(4, MapKey().telePhoneNumber),
          modelToWidget(5, MapKey().email),
          modelToWidget(6, MapKey().gender),
          modelToWidget(7, MapKey().belonging1),
          modelToWidget(8, MapKey().belonging2),
          modelToWidget(9, MapKey().belonging3),
        ],
      ),
    );
  }
}
