import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/hooks/use_l10n.dart';

//要素数増やすならview_modelとListView(edit_page側は条件分岐もある)内も
class ProfileLists extends StatelessWidget {
  ProfileLists({super.key});

  //firebaseからとってきたもの
  List getProfileList = [
    '小林ゆうひ',
    'kobayashiyuhi',
    'userID',
    '2002年/7月/22日',
    '0909-8869-9235',
    'qiuwphef@gmail.com',
    '男',
    '宮崎大学工学部',
    '水泳部',
    'サークル',
  ];

  List tempList = [];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
