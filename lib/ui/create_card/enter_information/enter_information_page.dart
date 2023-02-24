import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/select_template/select_template_view_model.dart';
import 'package:wru/ui/theme/app_theme.dart';

class InputItem {
  final String label;
  final bool? isMultiLine;

  InputItem({this.label = '', this.isMultiLine = false});
}

class EnterInformationPage extends HookConsumerWidget {
  const EnterInformationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final selectPageState = ref.watch(selectTemplateViewModelProvider);

    return selectPageState.when(
      data: (data) => Scaffold(
        backgroundColor: theme.appColors.background,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                data.selectedTemplate!.card,
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.separated(
                      itemCount: data.selectedTemplate!.inputItems.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextFormField(
                          keyboardType: data.selectedTemplate!.inputItems[index]
                                  .isMultiLine!
                              ? TextInputType.multiline
                              : TextInputType.none,
                          maxLines: data.selectedTemplate!.inputItems[index]
                                  .isMultiLine!
                              ? 3
                              : null,
                          decoration: InputDecoration(
                            labelText:
                                data.selectedTemplate!.inputItems[index].label,
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
