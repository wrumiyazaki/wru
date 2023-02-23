import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/templates/normal_card/normal_card_page.dart';

class SelectTemplatePage extends HookConsumerWidget {
  const SelectTemplatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templates = [
      const NormalCardPage(),
      const NormalCardPage(),
      const NormalCardPage(),
      const NormalCardPage(),
      const NormalCardPage()
    ];

    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            child: ListView.separated(
              itemCount: templates.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () => print('selected'),
                child: templates[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
