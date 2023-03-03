import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  late List tempList = [
    getProfileList[0],
    getProfileList[1],
    getProfileList[2],
    getProfileList[3],
    getProfileList[4],
    getProfileList[5],
    getProfileList[6],
    getProfileList[7],
    getProfileList[8],
    getProfileList[9],
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final getProfileListProvider = StateProvider((ref) {
  return ProfileLists().getProfileList;
});

final tempListProvider = StateProvider<List>((ref) {
  return ProfileLists().tempList;
});
