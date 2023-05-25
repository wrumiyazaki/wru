import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/exchange/sent_repository_impl.dart';
import 'package:wru/ui/profile/profile_view_model.dart';

//プロフィールのリポジトリからプロフィール情報を取得
final homeInfoListProvider = FutureProvider<List<dynamic>>((ref) async {
  await ref.read(getProfileListProvider.notifier).toFetch();
  final profileList = ref.watch(getProfileListProvider);
  return profileList;
});

//uidを取得
final homeUidProvider = FutureProvider<String>((ref) async {
  final uid = ref.watch(uidProvider);
  return uid;
});

//exchangeのsentリポジトリからmyCardのimgUrlを取得
final homeImgUrlProvider = FutureProvider<String?>((ref) async {
  final uid = ref.watch(uidProvider);
  final List docList =
      await ref.read(sentRepositoryProvider).fetchMyCardsDocId(uid);
  Map<String, dynamic>? myMap;
  if (docList.isNotEmpty) {
    myMap =
        await ref.read(sentRepositoryProvider).fetchMyNameCard(uid, docList[0]);
  }
  if (myMap == null || myMap['imgUrl'] == null || myMap['imgUrl'].isEmpty) {
    return null;
  }
  return myMap['imgUrl'];
});

// final homeImgUrlProvider = StateNotifierProvider((ref)  => )

class homeImgUrlNotifier extends StateNotifier {
  homeImgUrlNotifier() : super('');
}
