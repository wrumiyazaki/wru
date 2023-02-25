import 'package:wru/ui/create_card/templates/cards/card_state.dart';
import 'package:wru/ui/create_card/templates/cards/normal_card/normal_card_page.dart';
import 'package:wru/ui/create_card/templates/cards/test_card/test_card_page.dart';

class CardTemplate {
  static var normalTemplate = const NormalCardPage(CardState([
    '〇〇大学',
    '△△学部',
    '〇〇コース〇〇専攻',
    'X',
    '山田 太郎',
    'Taro Yamada',
    '〇〇県 〇〇高校出身\nサッカー歴11年\n好きな歌 国家'
  ]));
  static var testTemplate = const TestCardPage(CardState([
    '山田 太郎',
    'Taro Yamada',
    '〇〇大学',
    '△△学部',
    '〇〇コース〇〇専攻',
    'X',
    '〇〇県 〇〇高校出身\nサッカー歴11年\n好きな歌 国家'
  ]));
}
