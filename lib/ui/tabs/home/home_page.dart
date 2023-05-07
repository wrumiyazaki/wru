import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/profile/profile_view_model.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/home/home_view_model.dart';
import 'package:wru/ui/tabs/home/home_viewmodel.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final provider = ref.watch(homeProvider);
    return SafeArea(
        child: Column(
      children: [
        //プロフィールボックス
        Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 80),
          decoration: BoxDecoration(
              color: theme.appColors.homeProfileBackground,
              borderRadius: BorderRadius.circular(10)),
          //テキストとボタンを横に並べる
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              //テキストの集まりコンテナ
              Container(
                height: 150,
                width: 200,
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                //テキストカラム
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    provider.when(
                      data: (info) {
                        if (info['name'] != null) {
                          return FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                info['name'],
                                style: theme.textTheme.h40.bold().copyWith(
                                    color: theme.appColors.homeProfileText),
                              ));
                        } else {
                          return const Text('');
                        }
                      },
                      error: (error, stack) => Text('Error: $error'),
                      loading: () => const Text(''),
                    ),
                    const SizedBox(height: 0),
                    provider.when(
                      data: (info) {
                        if (info['namePhonetic'] != null) {
                          return FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                info['namePhonetic'],
                                style: theme.textTheme.h40.bold().copyWith(
                                    color: theme.appColors.homeProfileText),
                              ));
                        } else {
                          return Text(
                            'プロフィールが入力されていません',
                            style: TextStyle(
                                color: theme.appColors.homeProfileText),
                          );
                        }
                      },
                      error: (error, stack) => Text('Error: $error'),
                      loading: () => const Text(''),
                    ),

                    const SizedBox(height: 7),
                    // Text(
                    //   "Exchange : 18",
                    //   style: theme.textTheme.h40
                    //       .bold()
                    //       .copyWith(color: theme.appColors.homeProfileText),
                    // ),
                    const SizedBox(height: 5),
                    provider.when(
                      data: (info) {
                        if (info['name'] != null) {
                          return Text(
                            'userID : ${info['uid']}',
                            style: theme.textTheme.h20.bold().copyWith(
                                color: theme.appColors.homeProfileText),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                      error: (error, stack) => Text('Error: $error'),
                      loading: () => const Text(''),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              //プロフィール画面へ遷移ボタンのコンテナ
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: theme.appColors.homeProfileText, width: 2)),
                child: IconButton(
                    icon: const Icon(Icons.settings),
                    iconSize: 80,
                    color: theme.appColors.homeProfileText,
                    onPressed: () async {
                      await ProfileViewModel().toFetch(ref);
                      context.router.push(const ProfileRoute());
                    }),
              ),
            ],
          ),
        ),

        //名刺画像Containerに影をつけるために囲む
        Material(
          // elevation: 8,
          //名刺画像コンテナ
          child: Container(
              //size55×91
              height: 200,
              width: 330.909,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: provider.when(
                data: (info) {
                  if (info['imgUrl'] != null) {
                    return Image.network(
                      info['imgUrl'],
                      fit: BoxFit.contain,
                    );
                  } else {
                    return const Text('名刺が作成されていません');
                  }
                },
                error: (error, stack) => Text('Error: $error'),
                loading: () => const CircularProgressIndicator(
                  color: Colors.grey,
                ),
              )

              // provider.when(
              //           data: (info) {
              //             return Text(
              //               'userID : ${info['uid']}',
              //               style: theme.textTheme.h20
              //                   .bold()
              //                   .copyWith(color: theme.appColors.homeProfileText),
              //             );
              //           },
              //           error: (error, stack) => Text('Error: $error'),
              //           loading: () => Container(),
              //         )
              ),
        ),

        //ボタンとテキストあわせたボタンのコンテナ
        Container(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              //ボタンとテキストを並べる
              child: Column(children: [
                const Icon(
                  Icons.add_to_photos,
                  size: 80,
                  color: Colors.grey,
                ),
                Text(
                  l10n.design,
                  style: theme.textTheme.h50.copyWith(color: Colors.grey),
                )
              ]),
              onPressed: () {
                //名刺作成画面に遷移
                context.router.push(const SelectTemplateRoute());
              },
            )),
      ],
    ));
  }
}
