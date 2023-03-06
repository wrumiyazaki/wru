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
  String? get name => throw _privateConstructorUsedError;
  String? get namePhonetic => throw _privateConstructorUsedError;
  String? get university => throw _privateConstructorUsedError;
  String? get major => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String? get faceImgUrl => throw _privateConstructorUsedError;

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
  $Res call(
      {String? name,
      String? namePhonetic,
      String? university,
      String? major,
      String? grade,
      String? text,
      String? imgUrl,
      String? faceImgUrl});
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
    Object? name = freezed,
    Object? namePhonetic = freezed,
    Object? university = freezed,
    Object? major = freezed,
    Object? grade = freezed,
    Object? text = freezed,
    Object? imgUrl = freezed,
    Object? faceImgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      namePhonetic: freezed == namePhonetic
          ? _value.namePhonetic
          : namePhonetic // ignore: cast_nullable_to_non_nullable
              as String?,
      university: freezed == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      major: freezed == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      faceImgUrl: freezed == faceImgUrl
          ? _value.faceImgUrl
          : faceImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String? name,
      String? namePhonetic,
      String? university,
      String? major,
      String? grade,
      String? text,
      String? imgUrl,
      String? faceImgUrl});
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
    Object? name = freezed,
    Object? namePhonetic = freezed,
    Object? university = freezed,
    Object? major = freezed,
    Object? grade = freezed,
    Object? text = freezed,
    Object? imgUrl = freezed,
    Object? faceImgUrl = freezed,
  }) {
    return _then(_$_NameCard(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      namePhonetic: freezed == namePhonetic
          ? _value.namePhonetic
          : namePhonetic // ignore: cast_nullable_to_non_nullable
              as String?,
      university: freezed == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      major: freezed == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      faceImgUrl: freezed == faceImgUrl
          ? _value.faceImgUrl
          : faceImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NameCard implements _NameCard {
  _$_NameCard(
      {this.name,
      this.namePhonetic,
      this.university,
      this.major,
      this.grade,
      this.text,
      this.imgUrl,
      this.faceImgUrl});

  factory _$_NameCard.fromJson(Map<String, dynamic> json) =>
      _$$_NameCardFromJson(json);

  @override
  final String? name;
  @override
  final String? namePhonetic;
  @override
  final String? university;
  @override
  final String? major;
  @override
  final String? grade;
  @override
  final String? text;
  @override
  final String? imgUrl;
  @override
  final String? faceImgUrl;

  @override
  String toString() {
    return 'NameCard(name: $name, namePhonetic: $namePhonetic, university: $university, major: $major, grade: $grade, text: $text, imgUrl: $imgUrl, faceImgUrl: $faceImgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameCard &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.namePhonetic, namePhonetic) ||
                other.namePhonetic == namePhonetic) &&
            (identical(other.university, university) ||
                other.university == university) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.faceImgUrl, faceImgUrl) ||
                other.faceImgUrl == faceImgUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, namePhonetic, university,
      major, grade, text, imgUrl, faceImgUrl);

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
  factory _NameCard(
      {final String? name,
      final String? namePhonetic,
      final String? university,
      final String? major,
      final String? grade,
      final String? text,
      final String? imgUrl,
      final String? faceImgUrl}) = _$_NameCard;

  factory _NameCard.fromJson(Map<String, dynamic> json) = _$_NameCard.fromJson;

  @override
  String? get name;
  @override
  String? get namePhonetic;
  @override
  String? get university;
  @override
  String? get major;
  @override
  String? get grade;
  @override
  String? get text;
  @override
  String? get imgUrl;
  @override
  String? get faceImgUrl;
  @override
  @JsonKey(ignore: true)
  _$$_NameCardCopyWith<_$_NameCard> get copyWith =>
      throw _privateConstructorUsedError;
}
