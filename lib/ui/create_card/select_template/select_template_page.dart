import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/select_template/select_template_view_model.dart';
import 'package:wru/ui/hooks/use_router.dart';
import 'package:wru/ui/routes/app_route.gr.dart';

class SelectTemplatePage extends HookConsumerWidget {
  const SelectTemplatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectTemplateViewModelProvider);
    final viewModel = ref.watch(selectTemplateViewModelProvider.notifier);
    final router = useRouter();

    return state.when(
      data: (data) => Scaffold(
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
                itemCount: data.templates.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    viewModel.select(index);
                    router.push(const EnterInformationRoute());
                  },
                  child: data.templates[index].card,
                ),
              ),
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
