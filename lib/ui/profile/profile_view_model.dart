import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/repository/profile/profile_repository_impl.dart';
import 'package:wru/ui/profile/profile_state.dart';

//要素数増やすならview_modelとListView(edit_page側は条件分岐もある)内も

final getProfileListProvider =
    StateNotifierProvider<getProfileListNotifier, List>((ref) {
  return getProfileListNotifier(ref);
});

class getProfileListNotifier extends StateNotifier<List> {
  getProfileListNotifier(this._ref) : super(ProfileLists().getProfileList);
  final Ref _ref;

  List printState() {
    return state;
  }

  String? printText(index) {
    return state[index];
  }

  //受け取ったとき
  void profileMapToList(Map map) {
    for (int i = 0; i < ProfileLists().profileKeyList.length; i++) {
      state[i] = map[ProfileLists().profileKeyList[i]];
    }
  }

  //保存するとき
  Map profileListToMap() {
    Map map = {};
    for (int i = 0; i < ProfileLists().profileKeyList.length; i++) {
      map[ProfileLists().profileKeyList[i]] = state[i];
    }
    return map;
  }

  void changeProfiles(tempList) {
    for (int i = 0; i < state.length; i++) {
      state[i] = tempList[i];
    }
  }

  Future<void> toFetch() async {
    Map map = await _ref.read(profileRepositoryProvider).fetchProfileMap();
    profileMapToList(map);
    print('tofetch');
    //tempListにgetProfileListの内容を入れる
    _ref
        .read(tempProfileListProvider.notifier)
        .reflectProfileList(printState());
  }
}

final tempProfileListProvider =
    StateNotifierProvider<tempProfileListNotifier, List>(
        (ref) => tempProfileListNotifier());

class tempProfileListNotifier extends StateNotifier<List> {
  tempProfileListNotifier() : super(ProfileLists().tempProfileList);

  void reflectProfileList(List profileList) {
    state = profileList;
  }

  void changeProfile(index, text) {
    state[index] = text;
  }

  List returnTempList() {
    return state;
  }
}

final profileViewModelProvider = Provider((ref) => ProfileViewModel(ref));

class ProfileViewModel {
  ProfileViewModel(this.ref);
  Ref ref;

  void toSave() {
    Map map = ref.read(getProfileListProvider.notifier).profileListToMap();
    for (int i = 0; i < ProfileLists().profileKeyList.length; i++) {
      ref.read(profileRepositoryProvider).saveProfileMap(map, i);
    }
  }
}
