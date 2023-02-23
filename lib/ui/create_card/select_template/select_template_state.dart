import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wru/ui/create_card/templates/template.dart';

part 'select_template_state.freezed.dart';

@freezed
class SelectTemplateState with _$SelectTemplateState {
  const factory SelectTemplateState({
    @Default([]) List<Template> templates,
    @Default(null) Template? selectedTemplate,
  }) = _SelectTemplateState;
}
