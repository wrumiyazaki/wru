import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class _ProfileWidget extends StatelessWidget {
  final String name;
  final String text;

  const _ProfileWidget({
    Key? key,
    required this.name,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(name),
        Text(text),
      ],
    ));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        _ProfileWidget(name: '名前', text: 'aaa'),
      ]),
    );
  }
}
