import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/enter_information/enter_information_state.dart';
import 'package:wru/ui/create_card/select_template/select_template_state.dart';
import 'package:wru/ui/create_card/select_template/select_template_view_model.dart';
import 'package:wru/ui/create_card/templates/cards/card_state.dart';
import 'package:wru/ui/create_card/templates/cards/card_view_model.dart';

final enterInformationViewModelProvider = StateNotifierProvider.autoDispose<
    EnterInformationViewModel, EnterInformationState>(
  (ref) => EnterInformationViewModel(ref: ref),
);

class EnterInformationViewModel extends StateNotifier<EnterInformationState> {
  EnterInformationViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const EnterInformationState()) {
    load();
  }
  final AutoDisposeStateNotifierProviderRef _ref;
  late SelectTemplateState _selectTemplateState;
  late CardState _cardState;
  late CardViewModel _cardViewModel;

  void load() {
    _selectTemplateState = _ref.watch(selectTemplateViewModelProvider);
    _cardState = _ref.watch(cardViewModelFamily([]));
    _cardViewModel = _ref.watch(cardViewModelFamily([]).notifier);
    state = EnterInformationState(
        selectedTemplate: _selectTemplateState.selectedTemplate,
        enteredInformations: _cardState.informations);
  }

  void updateInformation(int idx, String value) {
    _cardViewModel.updateInformation(idx, value);
  }
}
