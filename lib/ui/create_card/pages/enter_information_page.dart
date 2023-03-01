import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/create_card_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class EnterInformationPage extends HookConsumerWidget {
  const EnterInformationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(createCardViewModelProvider);
    final viewModel = ref.watch(createCardViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: theme.appColors.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle:
            theme.textTheme.h60.merge(const TextStyle(color: Colors.white)),
        title: const Text(
          '情報入力',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4e4f50),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.check_circle_rounded,
          size: 54,
        ),
        onPressed: () => print('submit'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              state.selectedTemplate!.card,
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.separated(
                    itemCount: state.selectedTemplate!.inputItems.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextFormField(
                        initialValue:
                            state.selectedTemplate!.inputInitialValue[index],
                        onChanged: (value) =>
                            viewModel.updateInformation(index, value),
                        keyboardType: state.selectedTemplate!.inputItems[index]
                                .isMultiLine!
                            ? TextInputType.multiline
                            : TextInputType.text,
                        maxLines: state.selectedTemplate!.inputItems[index]
                                .isMultiLine!
                            ? 3
                            : null,
                        decoration: InputDecoration(
                          labelText:
                              state.selectedTemplate!.inputItems[index].label,
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