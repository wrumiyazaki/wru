// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SentCard _$$_SentCardFromJson(Map<String, dynamic> json) => _$_SentCard(
      uid: json['uid'] as String,
      documentID: json['documentID'] as String,
      card: NameCard.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SentCardToJson(_$_SentCard instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'documentID': instance.documentID,
      'card': instance.card,
    };
