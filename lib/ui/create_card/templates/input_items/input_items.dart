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
  static final testInputItems = [
    InputItem(label: '名前'),
    InputItem(label: '名前(ローマ字表記)'),
    InputItem(label: '大学'),
    InputItem(label: '学部'),
    InputItem(label: '学科/専攻/コース'),
    InputItem(label: '学年'),
    InputItem(label: '出身/趣味など', isMultiLine: true)
  ];
}
