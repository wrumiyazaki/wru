// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NameCard _$NameCardFromJson(Map<String, dynamic> json) {
  return _NameCard.fromJson(json);
}

/// @nodoc
mixin _$NameCard {
  String get hoge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameCardCopyWith<NameCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameCardCopyWith<$Res> {
  factory $NameCardCopyWith(NameCard value, $Res Function(NameCard) then) =
      _$NameCardCopyWithImpl<$Res, NameCard>;
  @useResult
  $Res call({String hoge});
}

/// @nodoc
class _$NameCardCopyWithImpl<$Res, $Val extends NameCard>
    implements $NameCardCopyWith<$Res> {
  _$NameCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoge = null,
  }) {
    return _then(_value.copyWith(
      hoge: null == hoge
          ? _value.hoge
          : hoge // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NameCardCopyWith<$Res> implements $NameCardCopyWith<$Res> {
  factory _$$_NameCardCopyWith(
          _$_NameCard value, $Res Function(_$_NameCard) then) =
      __$$_NameCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hoge});
}

/// @nodoc
class __$$_NameCardCopyWithImpl<$Res>
    extends _$NameCardCopyWithImpl<$Res, _$_NameCard>
    implements _$$_NameCardCopyWith<$Res> {
  __$$_NameCardCopyWithImpl(
      _$_NameCard _value, $Res Function(_$_NameCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hoge = null,
  }) {
    return _then(_$_NameCard(
      hoge: null == hoge
          ? _value.hoge
          : hoge // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NameCard implements _NameCard {
  _$_NameCard({required this.hoge});

  factory _$_NameCard.fromJson(Map<String, dynamic> json) =>
      _$$_NameCardFromJson(json);

  @override
  final String hoge;

  @override
  String toString() {
    return 'NameCard(hoge: $hoge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameCard &&
            (identical(other.hoge, hoge) || other.hoge == hoge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hoge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameCardCopyWith<_$_NameCard> get copyWith =>
      __$$_NameCardCopyWithImpl<_$_NameCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NameCardToJson(
      this,
    );
  }
}

abstract class _NameCard implements NameCard {
  factory _NameCard({required final String hoge}) = _$_NameCard;

  factory _NameCard.fromJson(Map<String, dynamic> json) = _$_NameCard.fromJson;

  @override
  String get hoge;
  @override
  @JsonKey(ignore: true)
  _$$_NameCardCopyWith<_$_NameCard> get copyWith =>
      throw _privateConstructorUsedError;
}
