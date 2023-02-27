import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/create_card_view_model.dart';
import 'package:wru/ui/create_card/select_template/select_template_page.dart';

class CreateCardPage extends HookConsumerWidget {
  const CreateCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createCardViewModelProvider);
    final viewModel = ref.watch(createCardViewModelProvider.notifier);
    return SelectTemplatePage(state: state, viewModel: viewModel);
  }
}
