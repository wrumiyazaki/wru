import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/create_card_view_model.dart';
import 'package:wru/ui/hooks/use_router.dart';
import 'package:wru/ui/routes/app_route.gr.dart';

class SelectTemplatePage extends HookConsumerWidget {
  const SelectTemplatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createCardViewModelProvider);
    final viewModel = ref.watch(createCardViewModelProvider.notifier);
    final router = useRouter();

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
              itemCount: state.templates.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  viewModel.selectTemplate(index);
                  router
                      .push(const EnterInformationRoute())
                      .then((_) => viewModel.load());
                },
                child: state.templates[index].card,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
