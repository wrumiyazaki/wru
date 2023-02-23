import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectTemplatePage extends HookConsumerWidget {
  const SelectTemplatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: Text('select template'),
      ),
    );
  }
}
