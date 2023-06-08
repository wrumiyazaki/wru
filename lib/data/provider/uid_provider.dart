import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wru/ui/profile/profile_view_model.dart';
import 'package:wru/ui/tabs/home/home_view_model.dart';

final initUidProvider = StateNotifierProvider((ref) => InitUidNotifier(ref));

final fetchUidProvider = StateNotifierProvider<FetchUidNotifier, AsyncValue>(
    (ref) => FetchUidNotifier(ref));

class FetchUidNotifier extends StateNotifier<AsyncValue> {
  FetchUidNotifier(this._ref) : super(const AsyncLoading()) {
    fetchUid();
  }
  final Ref _ref;
  static const key = "uid_key";

  Future fetchUid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final uid = pref.getString(key);
    if (uid == null) {
      state = const AsyncLoading();
      return;
    }
    _ref.read(uidProvider.notifier).state = uid;
    await _ref.read(getProfileListProvider.notifier).toFetch();
    await _ref.read(homeImgUrlProvider.notifier).getImgUrl();
    await _ref.read(homeInfoListProvider.notifier).fetch();
    state = AsyncValue.data(uid);
    return;
  }
}

class InitUidNotifier extends StateNotifier {
  InitUidNotifier(this._ref) : super('');
  final Ref _ref;
  final key = "uid_key";

  //uidを保存する
  Future<void> saveUid(String uid) async {
    //uidProviderに管理してもらう
    _ref.watch(uidProvider.notifier).state = uid;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, uid);
    print(_ref.watch(uidProvider));
  }
}

//uidのプロバイダー
final uidProvider = StateProvider((_) => '');
