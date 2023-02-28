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
    final boolsstate = ref.watch(boolsprovider);
    final boolsstatenotifier = ref.read(boolsprovider.notifier);

    Widget nameCard(index) {
      return Material(
        elevation: 5,
        child: Container(
          height: 250,
          width: 413.636,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: GestureDetector(
            onTap: () {
              boolsstatenotifier.state[index] = !boolsstate[index];
              boolsstatenotifier.state = [...boolsstate];
            },
            child: boolsstate[index]
                ? Image.asset(
                    //firebase
                    nameCardImage[index],
                    fit: BoxFit.contain,
                  )
                : Image.network(
                    //firebase
                    portraitImage[index],
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          itemCount: listlength,
          itemBuilder: (context, index) {
            return nameCard(index);
          },
        ),
      ),
    );
  }
}
