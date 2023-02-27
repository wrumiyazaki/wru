import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_state.freezed.dart';

@freezed
class CardState with _$CardState {
  const factory CardState({
    required List<String> informations,
  }) = _CardState;
}