import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/exchange/sent_repository_impl.dart';
import 'package:wru/data/repository/profile/profile_repository_impl.dart';

//名前、読み、uid
//自分の名刺 nullのときは？
final homeProvider = FutureProvider((ref) async {
  //プロフィールのリポジトリから取得
  final profileMap =
      await ref.watch(profileRepositoryProvider).fetchProfileMap();
  //uidを取得
  final uid = ref.watch(uidProvider);
  //imgUrlを取得
  final List docList =
      await ref.read(sentRepositoryProvider).fetchMyCardsDocId(uid);
  String? imgUrl;
  //自分の名刺を作成されているなら
  if (docList.isNotEmpty) {
    final Map? myMap =
        await ref.read(sentRepositoryProvider).fetchMyNameCard(uid, docList[0]);
    //myMapがnullだとimgUrlもnullになる
    if (myMap != null) {
      imgUrl = myMap['imgUrl'];
    }
  }

  Map map = {
    'name': profileMap['name'],
    'namePhonetic': profileMap['namePhonetic'],
    'uid': uid,
    'imgUrl': imgUrl,
  };
  return map;
});
