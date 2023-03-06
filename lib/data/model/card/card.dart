import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
abstract class NameCard with _$NameCard {
  factory NameCard({
    String? name,
    String? namePhonetic,
    String? university,
    String? major,
    String? grade,
    String? text,
    String? imgUrl,
    String? faceImgUrl,
  }) = _NameCard;

  factory NameCard.fromJson(Map<String, dynamic> json) =>
      _$NameCardFromJson(json);
}
