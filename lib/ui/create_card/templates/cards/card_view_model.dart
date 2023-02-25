import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/create_card/templates/cards/card_state.dart';

final cardViewModelFamily =
    StateNotifierProvider.family<CardViewModel, CardState, List<String>>(
  (ref, informations) => CardViewModel(informations: informations),
);

class CardViewModel extends StateNotifier<CardState> {
  CardViewModel({required List<String> informations})
      : super(CardState(informations: informations));
}
