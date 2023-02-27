import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wru/ui/create_card/templates/template.dart';

part 'enter_information_state.freezed.dart';

@freezed
class EnterInformationState with _$EnterInformationState {
  const factory EnterInformationState({
    @Default(null) Template? selectedTemplate,
    @Default([]) List<String> enteredInformations,
  }) = _EnterInformationState;
}
