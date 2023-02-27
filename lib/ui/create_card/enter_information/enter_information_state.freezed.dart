// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enter_information_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EnterInformationState {
  Template? get selectedTemplate => throw _privateConstructorUsedError;
  List<String> get enteredInformations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnterInformationStateCopyWith<EnterInformationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnterInformationStateCopyWith<$Res> {
  factory $EnterInformationStateCopyWith(EnterInformationState value,
          $Res Function(EnterInformationState) then) =
      _$EnterInformationStateCopyWithImpl<$Res, EnterInformationState>;
  @useResult
  $Res call({Template? selectedTemplate, List<String> enteredInformations});
}

/// @nodoc
class _$EnterInformationStateCopyWithImpl<$Res,
        $Val extends EnterInformationState>
    implements $EnterInformationStateCopyWith<$Res> {
  _$EnterInformationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTemplate = freezed,
    Object? enteredInformations = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_EnterInformationStateCopyWith<$Res>
    implements $EnterInformationStateCopyWith<$Res> {
  factory _$$_EnterInformationStateCopyWith(_$_EnterInformationState value,
          $Res Function(_$_EnterInformationState) then) =
      __$$_EnterInformationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Template? selectedTemplate, List<String> enteredInformations});
}

/// @nodoc
class __$$_EnterInformationStateCopyWithImpl<$Res>
    extends _$EnterInformationStateCopyWithImpl<$Res, _$_EnterInformationState>
    implements _$$_EnterInformationStateCopyWith<$Res> {
  __$$_EnterInformationStateCopyWithImpl(_$_EnterInformationState _value,
      $Res Function(_$_EnterInformationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTemplate = freezed,
    Object? enteredInformations = null,
  }) {
    return _then(_$_EnterInformationState(
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

class _$_EnterInformationState implements _EnterInformationState {
  const _$_EnterInformationState(
      {this.selectedTemplate = null,
      final List<String> enteredInformations = const []})
      : _enteredInformations = enteredInformations;

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
    return 'EnterInformationState(selectedTemplate: $selectedTemplate, enteredInformations: $enteredInformations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnterInformationState &&
            (identical(other.selectedTemplate, selectedTemplate) ||
                other.selectedTemplate == selectedTemplate) &&
            const DeepCollectionEquality()
                .equals(other._enteredInformations, _enteredInformations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedTemplate,
      const DeepCollectionEquality().hash(_enteredInformations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnterInformationStateCopyWith<_$_EnterInformationState> get copyWith =>
      __$$_EnterInformationStateCopyWithImpl<_$_EnterInformationState>(
          this, _$identity);
}

abstract class _EnterInformationState implements EnterInformationState {
  const factory _EnterInformationState(
      {final Template? selectedTemplate,
      final List<String> enteredInformations}) = _$_EnterInformationState;

  @override
  Template? get selectedTemplate;
  @override
  List<String> get enteredInformations;
  @override
  @JsonKey(ignore: true)
  _$$_EnterInformationStateCopyWith<_$_EnterInformationState> get copyWith =>
      throw _privateConstructorUsedError;
}
