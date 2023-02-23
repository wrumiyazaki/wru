import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/foundation/constants.dart';
import 'package:wru/ui/theme/app_text_theme.dart';
import 'package:wru/ui/theme/app_theme.dart';

class InputItem {
  final String label;
  final bool? isMultiLine;

  InputItem({this.label = '', this.isMultiLine = false});
}

class EnterInformationPage extends HookConsumerWidget {
  const EnterInformationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final inputItems = [
      InputItem(label: '大学'),
      InputItem(label: '学部'),
      InputItem(label: '学科/専攻/コース'),
      InputItem(label: '学年'),
      InputItem(label: '名前'),
      InputItem(label: '名前(ローマ字表記)'),
      InputItem(label: '出身/趣味など', isMultiLine: true)
    ];

    return Scaffold(
      backgroundColor: theme.appColors.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: Constants.cardAspectRatio,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '宮崎県 佐土原高校出身\nバドミントン歴11年\n好きなバンド Mrs. GREEN APPLE\n好きなアニメ 進撃の巨人',
                                      style: theme.textTheme.h20.dense(),
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
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.separated(
                    itemCount: inputItems.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextFormField(
                        keyboardType: inputItems[index].isMultiLine!
                            ? TextInputType.multiline
                            : TextInputType.none,
                        maxLines: inputItems[index].isMultiLine! ? 3 : null,
                        decoration: InputDecoration(
                          labelText: inputItems[index].label,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: theme.appColors.primary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: theme.appColors.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
