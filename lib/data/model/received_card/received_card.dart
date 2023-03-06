import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wru/data/model/card/card.dart';

part 'received_card.freezed.dart';
part 'received_card.g.dart';

@freezed
abstract class ReceivedCard with _$ReceivedCard {
  factory ReceivedCard({
    required NameCard card,
    required String memo,
  }) = _ReceivedCard;

  factory ReceivedCard.fromJson(Map<String, dynamic> json) =>
      _$ReceivedCardFromJson(json);
}
