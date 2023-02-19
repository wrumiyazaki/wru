import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:wru/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:wru/ui/xxx/xxx_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return SafeArea(
        child: Column(
      children: [
        Container(
          //プロフィールボックス
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
              color: theme.appColors.homeProfileBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            //テキストとボタンを横に並べる
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                //テキストの集まりコンテナ
                height: 150,
                width: 200,
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Column(
                  //テキストカラム
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "小林  ゆうひ",
                      style: theme.textTheme.h60
                          .bold()
                          .copyWith(color: theme.appColors.homeProfileText),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      "kobayashialyuhifasasad", //英数字22文字まで
                      style: theme.textTheme.h40
                          .bold()
                          .copyWith(color: theme.appColors.homeProfileText),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Exchange : 18",
                      style: theme.textTheme.h40
                          .bold()
                          .copyWith(color: theme.appColors.homeProfileText),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "userID:1092090",
                      style: theme.textTheme.h40
                          .bold()
                          .copyWith(color: theme.appColors.homeProfileText),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: theme.appColors.homeProfileText, width: 2)),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  iconSize: 80,
                  color: theme.appColors.homeProfileText,
                  onPressed: () => context.router.push(ProfileRoute()),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.amber),
          child: Text("aa"),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.green),
          child: Text("uu"),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        ),
      ],
    ));
  }
}
