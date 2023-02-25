import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/select_template/select_template_state.dart';
import 'package:wru/ui/create_card/templates/cards/cards.dart';
import 'package:wru/ui/create_card/templates/input_items/input_items.dart';
import 'package:wru/ui/create_card/templates/template.dart';

final selectTemplateViewModelProvider = StateNotifierProvider.autoDispose<
    SelectTemplateViewModel, SelectTemplateState>(
  (ref) => SelectTemplateViewModel(),
);

class SelectTemplateViewModel extends StateNotifier<SelectTemplateState> {
  SelectTemplateViewModel() : super(const SelectTemplateState()) {
    load();
  }

  void load() {
    state = SelectTemplateState(templates: [
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
    ]);
  }

  void select(int idx) {
    state = state.copyWith(selectedTemplate: state.templates[idx]);
  }
}
