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
                        initialValue: state.enteredInformations[index],
                        onChanged: (value) =>
                            viewModel.updateInformation(index, value),
                        keyboardType: state.selectedTemplate!.inputItems[index]
                                .isMultiLine!
                            ? TextInputType.multiline
                            : TextInputType.none,
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
