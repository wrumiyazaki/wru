import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/ui/profile/profile_state.dart';

//要素数増やすならview_modelとListView(edit_page側は条件分岐もある)内も

class getProfileListNotifier extends StateNotifier<List> {
  getProfileListNotifier() : super(getProfileList);
  String printText(index) {
    return state[index];
  }

  void changeProfiles(templist) {
    for (int i = 0; i < state.length; i++) {
      state[i] = templist[i];
    }
  }
}

class tempProfileListNotifier extends StateNotifier<List> {
  tempProfileListNotifier() : super(tempProfileList);
  void changeProfile(index, text) {
    state[index] = text;
  }

  List returnTempList() {
    return state;
  }
}
