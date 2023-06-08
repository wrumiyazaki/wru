import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/exchange/sent_repository_impl.dart';
import 'package:wru/ui/profile/profile_view_model.dart';

//プロフィールのリポジトリからプロフィール情報を取得

final homeInfoListProvider = StateNotifierProvider<homeInfoNotifier, List>(
    (ref) => homeInfoNotifier(ref));

class homeInfoNotifier extends StateNotifier<List> {
  homeInfoNotifier(this._ref) : super([]) {
    fetch();
  }

  final Ref _ref;
  Future<void> fetch() async {
    await _ref.read(getProfileListProvider.notifier).toFetch();
    final profileList = _ref.watch(getProfileListProvider);
    state = profileList;
  }
}

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
    if (uid == '') {
      return;
    }

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
      return;
    }
    state = myMap['imgUrl'];
  }
}
