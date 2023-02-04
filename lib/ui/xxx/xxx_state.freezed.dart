// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xxx_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$XXXState {
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $XXXStateCopyWith<XXXState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $XXXStateCopyWith<$Res> {
  factory $XXXStateCopyWith(XXXState value, $Res Function(XXXState) then) =
      _$XXXStateCopyWithImpl<$Res, XXXState>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$XXXStateCopyWithImpl<$Res, $Val extends XXXState>
    implements $XXXStateCopyWith<$Res> {
  _$XXXStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_XXXStateCopyWith<$Res> implements $XXXStateCopyWith<$Res> {
  factory _$$_XXXStateCopyWith(
          _$_XXXState value, $Res Function(_$_XXXState) then) =
      __$$_XXXStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$_XXXStateCopyWithImpl<$Res>
    extends _$XXXStateCopyWithImpl<$Res, _$_XXXState>
    implements _$$_XXXStateCopyWith<$Res> {
  __$$_XXXStateCopyWithImpl(
      _$_XXXState _value, $Res Function(_$_XXXState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$_XXXState(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_XXXState implements _XXXState {
  const _$_XXXState({this.count = 0});

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'XXXState(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_XXXState &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_XXXStateCopyWith<_$_XXXState> get copyWith =>
      __$$_XXXStateCopyWithImpl<_$_XXXState>(this, _$identity);
}

abstract class _XXXState implements XXXState {
  const factory _XXXState({final int count}) = _$_XXXState;

  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_XXXStateCopyWith<_$_XXXState> get copyWith =>
      throw _privateConstructorUsedError;
}
