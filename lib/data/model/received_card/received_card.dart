import 'package:freezed_annotation/freezed_annotation.dart';

part 'received_card.freezed.dart';
part 'received_card.g.dart';

@freezed
abstract class ReceivedCard with _$ReceivedCard {
  factory ReceivedCard({
    required String uid,
    required String documentID,
    required Map card,
    @Default('') String memo,
  }) = _ReceivedCard;

  factory ReceivedCard.fromJson(Map<String, dynamic> json) =>
      _$ReceivedCardFromJson(json);
}
