class InputItem {
  final String label;
  final bool? isMultiLine;

  InputItem({this.label = '', this.isMultiLine = false});
}

class InputItemsTemplate {
  static final normalInputItems = [
    InputItem(label: '大学'),
    InputItem(label: '学部'),
    InputItem(label: '学科/専攻/コース'),
    InputItem(label: '学年'),
    InputItem(label: '名前'),
    InputItem(label: '名前(ローマ字表記)'),
    InputItem(label: '出身/趣味など', isMultiLine: true)
  ];
  static final normalInputInitialValue = [
    '〇〇大学',
    '△△学部',
    '〇〇コース〇〇専攻',
    'X',
    '山田 太郎',
    'Taro Yamada',
    '〇〇県 〇〇高校出身\nサッカー歴11年\n好きな歌 国家'
  ];

  static final testInputItems = [
    InputItem(label: '名前'),
    InputItem(label: '名前(ローマ字表記)'),
    InputItem(label: '大学'),
    InputItem(label: '学部'),
    InputItem(label: '学科/専攻/コース'),
    InputItem(label: '学年'),
    InputItem(label: '出身/趣味など', isMultiLine: true)
  ];
  static final testInputInitialValue = [
    '山田 太郎',
    'Taro Yamada',
    '〇〇大学',
    '△△学部',
    '〇〇コース〇〇専攻',
    'X',
    '〇〇県 〇〇高校出身\nサッカー歴11年\n好きな歌 国家'
  ];
}
