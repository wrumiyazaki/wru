// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NameCard _$$_NameCardFromJson(Map<String, dynamic> json) => _$_NameCard(
      name: json['name'] as String?,
      namePhonetic: json['namePhonetic'] as String?,
      university: json['university'] as String?,
      major: json['major'] as String?,
      grade: json['grade'] as String?,
      text: json['text'] as String?,
      imgUrl: json['imgUrl'] as String?,
      faceImgUrl: json['faceImgUrl'] as String?,
    );

Map<String, dynamic> _$$_NameCardToJson(_$_NameCard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'namePhonetic': instance.namePhonetic,
      'university': instance.university,
      'major': instance.major,
      'grade': instance.grade,
      'text': instance.text,
      'imgUrl': instance.imgUrl,
      'faceImgUrl': instance.faceImgUrl,
    };
