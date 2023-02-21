import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/foundation/constants.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';

class CreateCardPage extends HookConsumerWidget {
  const CreateCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      backgroundColor: theme.appColors.background,
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: Constants.cardAspectRatio,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            child: Card(
              color: theme.appColors.surface,
              shadowColor: theme.appColors.primary,
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('宮崎大学', style: theme.textTheme.h30),
                        Text('理工学部', style: theme.textTheme.h30),
                      ],
                    ),
                    Row(
                      children: [
                        Text('情報コース知能情報専攻', style: theme.textTheme.h30),
                        Text('3', style: theme.textTheme.h30),
                        Text('年', style: theme.textTheme.h30),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: double.infinity,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('田村駿典',
                                      style: theme.textTheme.h50.bold()),
                                  Text('Shunsuke Tamura',
                                      style: theme.textTheme.h10.dense()),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text('宮崎県', style: theme.textTheme.h20),
                              Text('佐土原高校', style: theme.textTheme.h20),
                              Text('出身', style: theme.textTheme.h20),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'バドミントン歴11年\n好きなバンド Mrs. GREEN APPLE\n好きなアニメ 進撃の巨人',
                                style: theme.textTheme.h10.dense(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
