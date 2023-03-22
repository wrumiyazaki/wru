// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sent_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SentCard _$SentCardFromJson(Map<String, dynamic> json) {
  return _SentCard.fromJson(json);
}

/// @nodoc
mixin _$SentCard {
  String get uid => throw _privateConstructorUsedError;
  String get documentID => throw _privateConstructorUsedError;
  NameCard get card => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SentCardCopyWith<SentCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentCardCopyWith<$Res> {
  factory $SentCardCopyWith(SentCard value, $Res Function(SentCard) then) =
      _$SentCardCopyWithImpl<$Res, SentCard>;
  @useResult
  $Res call({String uid, String documentID, NameCard card});

  $NameCardCopyWith<$Res> get card;
}

/// @nodoc
class _$SentCardCopyWithImpl<$Res, $Val extends SentCard>
    implements $SentCardCopyWith<$Res> {
  _$SentCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? documentID = null,
    Object? card = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      documentID: null == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as NameCard,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NameCardCopyWith<$Res> get card {
    return $NameCardCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SentCardCopyWith<$Res> implements $SentCardCopyWith<$Res> {
  factory _$$_SentCardCopyWith(
          _$_SentCard value, $Res Function(_$_SentCard) then) =
      __$$_SentCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String documentID, NameCard card});

  @override
  $NameCardCopyWith<$Res> get card;
}

/// @nodoc
class __$$_SentCardCopyWithImpl<$Res>
    extends _$SentCardCopyWithImpl<$Res, _$_SentCard>
    implements _$$_SentCardCopyWith<$Res> {
  __$$_SentCardCopyWithImpl(
      _$_SentCard _value, $Res Function(_$_SentCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? documentID = null,
    Object? card = null,
  }) {
    return _then(_$_SentCard(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      documentID: null == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as NameCard,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SentCard implements _SentCard {
  _$_SentCard(
      {required this.uid, required this.documentID, required this.card});

  factory _$_SentCard.fromJson(Map<String, dynamic> json) =>
      _$$_SentCardFromJson(json);

  @override
  final String uid;
  @override
  final String documentID;
  @override
  final NameCard card;

  @override
  String toString() {
    return 'SentCard(uid: $uid, documentID: $documentID, card: $card)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SentCard &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.documentID, documentID) ||
                other.documentID == documentID) &&
            (identical(other.card, card) || other.card == card));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, documentID, card);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SentCardCopyWith<_$_SentCard> get copyWith =>
      __$$_SentCardCopyWithImpl<_$_SentCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SentCardToJson(
      this,
    );
  }
}

abstract class _SentCard implements SentCard {
  factory _SentCard(
      {required final String uid,
      required final String documentID,
      required final NameCard card}) = _$_SentCard;

  factory _SentCard.fromJson(Map<String, dynamic> json) = _$_SentCard.fromJson;

  @override
  String get uid;
  @override
  String get documentID;
  @override
  NameCard get card;
  @override
  @JsonKey(ignore: true)
  _$$_SentCardCopyWith<_$_SentCard> get copyWith =>
      throw _privateConstructorUsedError;
}
