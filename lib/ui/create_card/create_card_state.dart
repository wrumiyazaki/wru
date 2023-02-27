import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wru/ui/create_card/templates/template.dart';

part 'create_card_state.freezed.dart';

@freezed
class CreateCardState with _$CreateCardState {
  const factory CreateCardState({
    @Default([]) List<Template> templates,
    @Default(null) Template? selectedTemplate,
    @Default([]) List<String> enteredInformations,
  }) = _CreateCardState;
}
