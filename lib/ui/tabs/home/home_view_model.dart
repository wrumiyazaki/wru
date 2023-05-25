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

final homeImgUrlProvider = StateNotifierProvider<homeImgUrlNotifier, String?>(
    (ref) => homeImgUrlNotifier(ref));

class homeImgUrlNotifier extends StateNotifier<String?> {
  homeImgUrlNotifier(this._ref) : super(null) {
    getImgUrl();
  }

  final StateNotifierProviderRef _ref;
  late final uid = _ref.watch(uidProvider);

  //exchangeのsentリポジトリからmyCardのimgUrlを取得
  Future<void> getImgUrl() async {
    final List docList =
        await _ref.read(sentRepositoryProvider).fetchMyCardsDocId(uid);
    Map<String, dynamic>? myMap;
    if (docList.isNotEmpty) {
      myMap = await _ref
          .read(sentRepositoryProvider)
          .fetchMyNameCard(uid, docList[0]);
    }
    if (myMap == null || myMap['imgUrl'] == null || myMap['imgUrl'].isEmpty) {
      state = null;
    }
    state = myMap!['imgUrl'];
  }
}
