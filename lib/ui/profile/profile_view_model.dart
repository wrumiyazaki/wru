import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/repository/profile/profile_repository_impl.dart';
import 'package:wru/ui/profile/profile_state.dart';

//要素数増やすならview_modelとListView(edit_page側は条件分岐もある)内も

//uidを取得#TODO
String profileUid = '4MXOY43lcRVTSA8GVq1X8ioCqBf1';

final getProfileListProvider =
    StateNotifierProvider<getProfileListNotifier, List>(
        (ref) => getProfileListNotifier());

class getProfileListNotifier extends StateNotifier<List> {
  getProfileListNotifier() : super(ProfileLists().getProfileList);

  void printState() {
    print(state);
  }

  String printText(index) {
    return state[index];
  }

  void profileMapToList(Map map) {
    for (int i = 0; i < ProfileLists().profileKeyList.length; i++) {
      state[i] = map[ProfileLists().profileKeyList[i]];
    }
  }

  void changeProfiles(tempList) {
    for (int i = 0; i < state.length; i++) {
      state[i] = tempList[i];
    }
  }
}

class tempProfileListNotifier extends StateNotifier<List> {
  tempProfileListNotifier() : super(ProfileLists().tempProfileList);

  void changeProfile(index, text) {
    state[index] = text;
  }

  List returnTempList() {
    return state;
  }
}

class ProfileViewModel {
  Future<void> toFetch(WidgetRef ref) async {
    Map map = await ref.read(profileRepositoryProvider).fetchProfileMap();
    ref.read(getProfileListProvider.notifier).profileMapToList(map);
  }
}
