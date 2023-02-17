import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  ProfileElement('名前', 'aaa'),
  ProfileElement('所属', 'bbb'),
];

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  //プロフィール１つ分のWidget
  Widget modelToWidget(ProfileElement model) {
    return Container(
      child: Column(children: [
        Container(
          child: Text(model.name),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        ),
        Container(
          child: Text(model.text),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール'),
        actions: [],
      ),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) => modelToWidget(models[index]),
      ),
    );
  }
}
