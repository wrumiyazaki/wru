import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
abstract class NameCard with _$NameCard {
  factory NameCard({
    required String hoge,
  }) = _NameCard;

  factory NameCard.fromJson(Map<String, dynamic> json) =>
      _$NameCardFromJson(json);
}
