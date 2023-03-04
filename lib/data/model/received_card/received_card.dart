import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wru/data/model/card/card.dart';

part 'received_card.freezed.dart';

@freezed
abstract class ReceivedCard with _$ReceivedCard {
  factory ReceivedCard({
    required Card card,
    required String memo,
  }) = _ReceivedCard;

  factory ReceivedCard.fromJson(Map<String, dynamic> json) =>
      _$ReceivedCardFromJson(json);
}
