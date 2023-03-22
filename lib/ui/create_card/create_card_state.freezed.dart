// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateCardState {
  List<Template> get templates => throw _privateConstructorUsedError;
  Template? get selectedTemplate => throw _privateConstructorUsedError;
  List<String> get enteredInformations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateCardStateCopyWith<CreateCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCardStateCopyWith<$Res> {
  factory $CreateCardStateCopyWith(
          CreateCardState value, $Res Function(CreateCardState) then) =
      _$CreateCardStateCopyWithImpl<$Res, CreateCardState>;
  @useResult
  $Res call(
      {List<Template> templates,
      Template? selectedTemplate,
      List<String> enteredInformations});
}

/// @nodoc
class _$CreateCardStateCopyWithImpl<$Res, $Val extends CreateCardState>
    implements $CreateCardStateCopyWith<$Res> {
  _$CreateCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = null,
    Object? selectedTemplate = freezed,
    Object? enteredInformations = null,
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
      enteredInformations: null == enteredInformations
          ? _value.enteredInformations
          : enteredInformations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCardStateCopyWith<$Res>
    implements $CreateCardStateCopyWith<$Res> {
  factory _$$_CreateCardStateCopyWith(
          _$_CreateCardState value, $Res Function(_$_CreateCardState) then) =
      __$$_CreateCardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Template> templates,
      Template? selectedTemplate,
      List<String> enteredInformations});
}

/// @nodoc
class __$$_CreateCardStateCopyWithImpl<$Res>
    extends _$CreateCardStateCopyWithImpl<$Res, _$_CreateCardState>
    implements _$$_CreateCardStateCopyWith<$Res> {
  __$$_CreateCardStateCopyWithImpl(
      _$_CreateCardState _value, $Res Function(_$_CreateCardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = null,
    Object? selectedTemplate = freezed,
    Object? enteredInformations = null,
  }) {
    return _then(_$_CreateCardState(
      templates: null == templates
          ? _value._templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<Template>,
      selectedTemplate: freezed == selectedTemplate
          ? _value.selectedTemplate
          : selectedTemplate // ignore: cast_nullable_to_non_nullable
              as Template?,
      enteredInformations: null == enteredInformations
          ? _value._enteredInformations
          : enteredInformations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CreateCardState implements _CreateCardState {
  const _$_CreateCardState(
      {final List<Template> templates = const [],
      this.selectedTemplate = null,
      final List<String> enteredInformations = const []})
      : _templates = templates,
        _enteredInformations = enteredInformations;

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
  final List<String> _enteredInformations;
  @override
  @JsonKey()
  List<String> get enteredInformations {
    if (_enteredInformations is EqualUnmodifiableListView)
      return _enteredInformations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enteredInformations);
  }

  @override
  String toString() {
    return 'CreateCardState(templates: $templates, selectedTemplate: $selectedTemplate, enteredInformations: $enteredInformations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateCardState &&
            const DeepCollectionEquality()
                .equals(other._templates, _templates) &&
            (identical(other.selectedTemplate, selectedTemplate) ||
                other.selectedTemplate == selectedTemplate) &&
            const DeepCollectionEquality()
                .equals(other._enteredInformations, _enteredInformations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_templates),
      selectedTemplate,
      const DeepCollectionEquality().hash(_enteredInformations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCardStateCopyWith<_$_CreateCardState> get copyWith =>
      __$$_CreateCardStateCopyWithImpl<_$_CreateCardState>(this, _$identity);
}

abstract class _CreateCardState implements CreateCardState {
  const factory _CreateCardState(
      {final List<Template> templates,
      final Template? selectedTemplate,
      final List<String> enteredInformations}) = _$_CreateCardState;

  @override
  List<Template> get templates;
  @override
  Template? get selectedTemplate;
  @override
  List<String> get enteredInformations;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCardStateCopyWith<_$_CreateCardState> get copyWith =>
      throw _privateConstructorUsedError;
}
