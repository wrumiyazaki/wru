// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      myCards: (json['myCards'] as List<dynamic>?)
          ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
      receivedCards: (json['receivedCards'] as List<dynamic>?)
          ?.map((e) => ReceivedCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'profile': instance.profile?.toJson(),
      'myCards': instance.myCards?.map((e) => e.toJson()).toList(),
      'receivedCards': instance.receivedCards?.map((e) => e.toJson()).toList(),
    };
