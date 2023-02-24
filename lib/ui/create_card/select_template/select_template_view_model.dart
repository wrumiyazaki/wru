import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/select_template/select_template_state.dart';
import 'package:wru/ui/create_card/templates/cards/cards.dart';
import 'package:wru/ui/create_card/templates/input_items/input_items.dart';
import 'package:wru/ui/create_card/templates/template.dart';

final selectTemplateViewModelProvider = StateNotifierProvider.autoDispose<
    SelectTemplateViewModel, AsyncValue<SelectTemplateState>>(
  (ref) => SelectTemplateViewModel(ref: ref),
);

class SelectTemplateViewModel
    extends StateNotifier<AsyncValue<SelectTemplateState>> {
  SelectTemplateViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    load();
  }
  final Ref _ref;

  void load() {
    state = AsyncValue.data(
      SelectTemplateState(templates: [
        Template(
          CardTemplate.normalTemplate,
          InputItemsTemplate.normalInputItems,
        ),
        Template(
          CardTemplate.testTemplate,
          InputItemsTemplate.normalInputItems,
        ),
        Template(
          CardTemplate.normalTemplate,
          InputItemsTemplate.normalInputItems,
        ),
        Template(
          CardTemplate.testTemplate,
          InputItemsTemplate.normalInputItems,
        ),
        Template(
          CardTemplate.normalTemplate,
          InputItemsTemplate.normalInputItems,
        ),
        Template(
          CardTemplate.testTemplate,
          InputItemsTemplate.normalInputItems,
        ),
      ]),
    );
  }

  void select(int idx) {
    state = AsyncValue.data(
      state.value!.copyWith(selectedTemplate: state.value!.templates[idx]),
    );
  }
}
