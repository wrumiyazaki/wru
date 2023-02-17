import 'package:flutter/material.dart';

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

Widget modelToWidget(ProfileElement model) {
  return Container(
    child: Column(children: [
      Text(model.name),
      Text(model.text),
    ]),
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) => modelToWidget(models[index]),
      ),
    );
  }
}
