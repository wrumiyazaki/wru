import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<String> nameCardImage = [
  'assets/img/namecard-sample.png',
  'assets/img/namecard-sample.png',
  'assets/img/namecard-sample.png',
  'assets/img/namecard-sample.png',
  'assets/img/namecard-sample.png',
];

final List<String> portraitImage = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
];

//firebaseから要素数を取得
final listlength = nameCardImage.length;

final List<bool> boolList = List.filled(listlength, true);

final boolsprovider = StateProvider<List>((ref) {
  return boolList;
});

class FriendPage extends HookConsumerWidget {
  FriendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
