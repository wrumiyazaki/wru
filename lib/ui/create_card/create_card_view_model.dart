import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/create_card_state.dart';
import 'package:wru/ui/create_card/templates/cards/card_view_model.dart';
import 'package:wru/ui/create_card/templates/cards/normal_card/normal_card_page.dart';
import 'package:wru/ui/create_card/templates/input_items/input_items.dart';
import 'package:wru/ui/create_card/templates/template.dart';

final createCardViewModelProvider =
    StateNotifierProvider.autoDispose<CreateCardViewModel, CreateCardState>(
  (ref) => CreateCardViewModel(ref: ref),
);

class CreateCardViewModel extends StateNotifier<CreateCardState> {
  CreateCardViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const CreateCardState()) {
    load();
  }
  final AutoDisposeStateNotifierProviderRef _ref;

  void load() {
    final normalCardState = _ref
        .watch(cardViewModelFamily(InputItemsTemplate.normalInputInitialValue));
    final normalTemplate = Template(
      NormalCardPage(state: normalCardState),
      normalCardState,
      InputItemsTemplate.normalInputItems,
    );

    final testCardState = _ref
        .watch(cardViewModelFamily(InputItemsTemplate.testInputInitialValue));
    final testTemplate = Template(
      NormalCardPage(state: testCardState),
      testCardState,
      InputItemsTemplate.testInputItems,
    );

    state = CreateCardState(templates: [
      normalTemplate,
      testTemplate,
      normalTemplate,
      testTemplate,
      normalTemplate,
      testTemplate,
      normalTemplate,
      testTemplate,
    ]);
  }

  void selectTemplate(int idx) {
    state = state.copyWith(selectedTemplate: state.templates[idx]);
  }
}
