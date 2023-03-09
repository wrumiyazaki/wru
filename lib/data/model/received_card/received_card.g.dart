// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceivedCard _$$_ReceivedCardFromJson(Map<String, dynamic> json) =>
    _$_ReceivedCard(
      uid: json['uid'] as String,
      documentID: json['documentID'] as String,
      card: NameCard.fromJson(json['card'] as Map<String, dynamic>),
      memo: json['memo'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReceivedCardToJson(_$_ReceivedCard instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'documentID': instance.documentID,
      'card': instance.card,
      'memo': instance.memo,
    };
