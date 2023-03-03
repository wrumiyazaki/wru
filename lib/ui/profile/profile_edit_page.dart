import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final boolprovider =
        StateProvider((ref) => false); //ページが再描画されるときにfalseになってほしいのでここに書く
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    List<String> profilePropList = [
      l10n.name,
      l10n.namePhonetic,
      l10n.userID,
      l10n.birthday,
      l10n.telePhoneNumber,
      l10n.email,
      l10n.gender,
      l10n.belonging1,
      l10n.belonging2,
      l10n.belonging3,
    ];

    //プロフィール編集１つ分のWidget
    Widget modelToWidget(index) {
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
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              controller: TextEditingController(
                  text: ProfileLists().getProfileList[index]),
              onChanged: (value) {
                ProfileLists().tempList[index] = value;
                ref.read(boolprovider.notifier).state = true;
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
          Consumer(
            builder: (context, ref, child) => Container(
              child: ref.watch(boolprovider)
                  ? TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        // firebaseに保存する処理がここにくる
                        context.pushRoute(TabRoute());
                        ref.read(boolprovider.notifier).state = false;
                      },
                      child: Text(
                        '保存',
                        style:
                            theme.textTheme.h40.copyWith(color: Colors.black),
                      ),
                    )
                  : null,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: profilePropList.length,
        itemBuilder: (context, index) {
          return modelToWidget(index);
        },
      ),
    );
  }
}
