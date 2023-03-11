// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceivedCard _$$_ReceivedCardFromJson(Map<String, dynamic> json) =>
    _$_ReceivedCard(
      card: Card.fromJson(json['card'] as Map<String, dynamic>),
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$$_ReceivedCardToJson(_$_ReceivedCard instance) =>
    <String, dynamic>{
      'card': instance.card,
      'memo': instance.memo,
    };
