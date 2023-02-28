import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boolsprovider = StateProvider<List>((ref) {
  return FriendViewModel().boolList;
});

class FriendViewModel extends StatelessWidget {
  FriendViewModel({super.key});

  //firebaseから取得
  final List<String> nameCardImage = [
    'assets/img/namecard-sample.png',
    'assets/img/namecard-sample.png',
    'assets/img/namecard-sample.png',
    'assets/img/namecard-sample.png',
    'assets/img/namecard-sample.png',
  ];

//firebaseから取得
  final List<String> portraitImage = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png',
  ];

//firebaseから要素数を取得
  late final listlength = nameCardImage.length;

  late final List<bool> boolList = List.filled(listlength, true);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
