import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
abstract class Card with _$Card {
  factory Card({
    required String hoge,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}
