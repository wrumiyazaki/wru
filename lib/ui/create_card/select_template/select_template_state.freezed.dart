// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_template_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectTemplateState {
  List<Template> get templates => throw _privateConstructorUsedError;
  Template? get selectedTemplate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectTemplateStateCopyWith<SelectTemplateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectTemplateStateCopyWith<$Res> {
  factory $SelectTemplateStateCopyWith(
          SelectTemplateState value, $Res Function(SelectTemplateState) then) =
      _$SelectTemplateStateCopyWithImpl<$Res, SelectTemplateState>;
  @useResult
  $Res call({List<Template> templates, Template? selectedTemplate});
}

/// @nodoc
class _$SelectTemplateStateCopyWithImpl<$Res, $Val extends SelectTemplateState>
    implements $SelectTemplateStateCopyWith<$Res> {
  _$SelectTemplateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = null,
    Object? selectedTemplate = freezed,
  }) {
    return _then(_value.copyWith(
      templates: null == templates
          ? _value.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<Template>,
      selectedTemplate: freezed == selectedTemplate
          ? _value.selectedTemplate
          : selectedTemplate // ignore: cast_nullable_to_non_nullable
              as Template?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectTemplateStateCopyWith<$Res>
    implements $SelectTemplateStateCopyWith<$Res> {
  factory _$$_SelectTemplateStateCopyWith(_$_SelectTemplateState value,
          $Res Function(_$_SelectTemplateState) then) =
      __$$_SelectTemplateStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Template> templates, Template? selectedTemplate});
}

/// @nodoc
class __$$_SelectTemplateStateCopyWithImpl<$Res>
    extends _$SelectTemplateStateCopyWithImpl<$Res, _$_SelectTemplateState>
    implements _$$_SelectTemplateStateCopyWith<$Res> {
  __$$_SelectTemplateStateCopyWithImpl(_$_SelectTemplateState _value,
      $Res Function(_$_SelectTemplateState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = null,
    Object? selectedTemplate = freezed,
  }) {
    return _then(_$_SelectTemplateState(
      templates: null == templates
          ? _value._templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<Template>,
      selectedTemplate: freezed == selectedTemplate
          ? _value.selectedTemplate
          : selectedTemplate // ignore: cast_nullable_to_non_nullable
              as Template?,
    ));
  }
}

/// @nodoc

class _$_SelectTemplateState implements _SelectTemplateState {
  const _$_SelectTemplateState(
      {final List<Template> templates = const [], this.selectedTemplate = null})
      : _templates = templates;

  final List<Template> _templates;
  @override
  @JsonKey()
  List<Template> get templates {
    if (_templates is EqualUnmodifiableListView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templates);
  }

  @override
  @JsonKey()
  final Template? selectedTemplate;

  @override
  String toString() {
    return 'SelectTemplateState(templates: $templates, selectedTemplate: $selectedTemplate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectTemplateState &&
            const DeepCollectionEquality()
                .equals(other._templates, _templates) &&
            (identical(other.selectedTemplate, selectedTemplate) ||
                other.selectedTemplate == selectedTemplate));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_templates), selectedTemplate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectTemplateStateCopyWith<_$_SelectTemplateState> get copyWith =>
      __$$_SelectTemplateStateCopyWithImpl<_$_SelectTemplateState>(
          this, _$identity);
}

abstract class _SelectTemplateState implements SelectTemplateState {
  const factory _SelectTemplateState(
      {final List<Template> templates,
      final Template? selectedTemplate}) = _$_SelectTemplateState;

  @override
  List<Template> get templates;
  @override
  Template? get selectedTemplate;
  @override
  @JsonKey(ignore: true)
  _$$_SelectTemplateStateCopyWith<_$_SelectTemplateState> get copyWith =>
      throw _privateConstructorUsedError;
}
