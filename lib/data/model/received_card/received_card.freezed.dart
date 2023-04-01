// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceivedCard _$ReceivedCardFromJson(Map<String, dynamic> json) {
  return _ReceivedCard.fromJson(json);
}

/// @nodoc
mixin _$ReceivedCard {
  String get uid => throw _privateConstructorUsedError;
  String get documentID => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get card => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceivedCardCopyWith<ReceivedCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedCardCopyWith<$Res> {
  factory $ReceivedCardCopyWith(
          ReceivedCard value, $Res Function(ReceivedCard) then) =
      _$ReceivedCardCopyWithImpl<$Res, ReceivedCard>;
  @useResult
  $Res call(
      {String uid, String documentID, Map<dynamic, dynamic> card, String memo});
}

/// @nodoc
class _$ReceivedCardCopyWithImpl<$Res, $Val extends ReceivedCard>
    implements $ReceivedCardCopyWith<$Res> {
  _$ReceivedCardCopyWithImpl(this._value, this._then);

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
    Object? memo = null,
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
              as Map<dynamic, dynamic>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceivedCardCopyWith<$Res>
    implements $ReceivedCardCopyWith<$Res> {
  factory _$$_ReceivedCardCopyWith(
          _$_ReceivedCard value, $Res Function(_$_ReceivedCard) then) =
      __$$_ReceivedCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid, String documentID, Map<dynamic, dynamic> card, String memo});
}

/// @nodoc
class __$$_ReceivedCardCopyWithImpl<$Res>
    extends _$ReceivedCardCopyWithImpl<$Res, _$_ReceivedCard>
    implements _$$_ReceivedCardCopyWith<$Res> {
  __$$_ReceivedCardCopyWithImpl(
      _$_ReceivedCard _value, $Res Function(_$_ReceivedCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? documentID = null,
    Object? card = null,
    Object? memo = null,
  }) {
    return _then(_$_ReceivedCard(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      documentID: null == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value._card
          : card // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceivedCard implements _ReceivedCard {
  _$_ReceivedCard(
      {required this.uid,
      required this.documentID,
      required final Map<dynamic, dynamic> card,
      this.memo = ''})
      : _card = card;

  factory _$_ReceivedCard.fromJson(Map<String, dynamic> json) =>
      _$$_ReceivedCardFromJson(json);

  @override
  final String uid;
  @override
  final String documentID;
  final Map<dynamic, dynamic> _card;
  @override
  Map<dynamic, dynamic> get card {
    if (_card is EqualUnmodifiableMapView) return _card;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_card);
  }

  @override
  @JsonKey()
  final String memo;

  @override
  String toString() {
    return 'ReceivedCard(uid: $uid, documentID: $documentID, card: $card, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceivedCard &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.documentID, documentID) ||
                other.documentID == documentID) &&
            const DeepCollectionEquality().equals(other._card, _card) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, documentID,
      const DeepCollectionEquality().hash(_card), memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceivedCardCopyWith<_$_ReceivedCard> get copyWith =>
      __$$_ReceivedCardCopyWithImpl<_$_ReceivedCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceivedCardToJson(
      this,
    );
  }
}

abstract class _ReceivedCard implements ReceivedCard {
  factory _ReceivedCard(
      {required final String uid,
      required final String documentID,
      required final Map<dynamic, dynamic> card,
      final String memo}) = _$_ReceivedCard;

  factory _ReceivedCard.fromJson(Map<String, dynamic> json) =
      _$_ReceivedCard.fromJson;

  @override
  String get uid;
  @override
  String get documentID;
  @override
  Map<dynamic, dynamic> get card;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_ReceivedCardCopyWith<_$_ReceivedCard> get copyWith =>
      throw _privateConstructorUsedError;
}
