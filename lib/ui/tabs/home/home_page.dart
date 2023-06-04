import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wru/ui/hooks/use_l10n.dart';
import 'package:wru/ui/profile/profile_view_model.dart';
import 'package:wru/ui/routes/app_route.gr.dart';
import 'package:wru/ui/tabs/home/home_view_model.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final infoList = ref.watch(homeInfoListProvider);
    final uid = ref.watch(homeUidProvider);
    final imgUrl = ref.watch(homeImgUrlProvider);

    return SafeArea(
        child: Column(
      children: [
        //プロフィールボックス
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 80),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                //テキストカラム
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    infoList.when(
                      data: (info) {
                        if (info.isNotEmpty &&
                            info[0] != '' &&
                            info[0] != null) {
                          print(info);
                          return FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                //名前の表示
                                info[0],
                                style: theme.textTheme.h40.bold().copyWith(
                                    color: theme.appColors.homeProfileText),
                              ));
                        } else {
                          return Text(
                            'プロフィールが入力されていません',
                            style: theme.textTheme.h30.bold().copyWith(
                                color: theme.appColors.homeProfileText),
                          );
                        }
                      },
                      error: (error, stack) => Text('Error: $error'),
                      loading: () => const Text(''),
                    ),
                    const SizedBox(height: 0),
                    infoList.when(
                      data: (info) {
                        if (info.isNotEmpty &&
                            info[1] != '' &&
                            info[1] != null) {
                          return FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                //読み方の表示
                                info[1],
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

                    const SizedBox(height: 7),
                    // Text(
                    //   "Exchange : 18",
                    //   style: theme.textTheme.h40
                    //       .bold()
                    //       .copyWith(color: theme.appColors.homeProfileText),
                    // ),
                    const SizedBox(height: 5),
                    uid.when(
                      data: (info) {
                        return Text(
                          //userIDの表示
                          'userID : $info',
                          style: theme.textTheme.h20
                              .bold()
                              .copyWith(color: theme.appColors.homeProfileText),
                        );
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
                      await ref.read(getProfileListProvider.notifier).toFetch();
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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: imgUrl != null
                  ? Image.network(
                      imgUrl,
                      fit: BoxFit.contain,
                    )
                  : const Text('名刺が作成されていません')),
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
