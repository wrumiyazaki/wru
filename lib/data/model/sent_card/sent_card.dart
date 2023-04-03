import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wru/data/model/card/card.dart';

part 'sent_card.freezed.dart';
part 'sent_card.g.dart';

@freezed
abstract class SentCard with _$SentCard {
  factory SentCard({
    required String uid,
    required String documentID,
    required Map card,
  }) = _SentCard;

  factory SentCard.fromJson(Map<String, dynamic> json) =>
      _$SentCardFromJson(json);
}
