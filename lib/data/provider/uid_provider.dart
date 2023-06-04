import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final initUidProvider = StateNotifierProvider((ref) => InitUidNotifier(ref));

final fetchUidProvider = FutureProvider((ref) async {
  const key = "uid_key";
  SharedPreferences pref = await SharedPreferences.getInstance();
  //uidProviderに管理してもらう
  final uid = pref.getString(key) ?? '';
  ref.watch(uidProvider.notifier).state = uid;
  return uid;
});

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
