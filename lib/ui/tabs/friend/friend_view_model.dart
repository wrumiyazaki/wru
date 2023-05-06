import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boolsprovider = StateProvider<List>((ref) {
  return FriendViewModel().boolList;
});

final frinedindexprovider = StateProvider((ref) => 0);

final List<String> friendsmemo = [
  'aaa',
  'iii',
  'uuuoooぁｋｓｊｄｆぁｋｊふぁ；ｓｊ\n\naa\nfasf\n\n\nddd\nddd',
  'eee',
  'ooo',
];

final imgListProvider = StateNotifierProvider<imgListNotifier, List<String>>(
    (ref) => imgListNotifier(ref));

class imgListNotifier extends StateNotifier<List<String>> {
  imgListNotifier(this._ref) : super([]);

  void getUrl(int i, String url) {
    state[i] = url;
  }

  final Ref _ref;
}

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
    'https://media.istockphoto.com/id/946516860/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E9%9D%92%E3%81%84%E7%A9%BA%E3%81%A8%E6%B5%9C%E6%9D%BE%E7%94%BA%E6%97%A5%E6%9C%AC%E3%81%A7%E6%99%B4%E3%82%8C%E3%81%9F%E6%97%A5%E3%81%AE%E4%B8%8B%E3%81%A7%E3%81%AE%E6%9D%B1%E4%BA%AC%E3%82%BF%E3%83%AF%E3%83%BC.jpg?s=2048x2048&w=is&k=20&c=B893-I7U1DOVp-ePN0fddjo_4Zk05ySED452ZaHbVaw=',
    'https://media.istockphoto.com/id/946516860/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E9%9D%92%E3%81%84%E7%A9%BA%E3%81%A8%E6%B5%9C%E6%9D%BE%E7%94%BA%E6%97%A5%E6%9C%AC%E3%81%A7%E6%99%B4%E3%82%8C%E3%81%9F%E6%97%A5%E3%81%AE%E4%B8%8B%E3%81%A7%E3%81%AE%E6%9D%B1%E4%BA%AC%E3%82%BF%E3%83%AF%E3%83%BC.jpg?s=2048x2048&w=is&k=20&c=B893-I7U1DOVp-ePN0fddjo_4Zk05ySED452ZaHbVaw=',
    'https://media.istockphoto.com/id/946516860/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E9%9D%92%E3%81%84%E7%A9%BA%E3%81%A8%E6%B5%9C%E6%9D%BE%E7%94%BA%E6%97%A5%E6%9C%AC%E3%81%A7%E6%99%B4%E3%82%8C%E3%81%9F%E6%97%A5%E3%81%AE%E4%B8%8B%E3%81%A7%E3%81%AE%E6%9D%B1%E4%BA%AC%E3%82%BF%E3%83%AF%E3%83%BC.jpg?s=2048x2048&w=is&k=20&c=B893-I7U1DOVp-ePN0fddjo_4Zk05ySED452ZaHbVaw=',
    'https://media.istockphoto.com/id/946516860/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E9%9D%92%E3%81%84%E7%A9%BA%E3%81%A8%E6%B5%9C%E6%9D%BE%E7%94%BA%E6%97%A5%E6%9C%AC%E3%81%A7%E6%99%B4%E3%82%8C%E3%81%9F%E6%97%A5%E3%81%AE%E4%B8%8B%E3%81%A7%E3%81%AE%E6%9D%B1%E4%BA%AC%E3%82%BF%E3%83%AF%E3%83%BC.jpg?s=2048x2048&w=is&k=20&c=B893-I7U1DOVp-ePN0fddjo_4Zk05ySED452ZaHbVaw=',
    'https://media.istockphoto.com/id/946516860/ja/%E3%82%B9%E3%83%88%E3%83%83%E3%82%AF%E3%83%95%E3%82%A9%E3%83%88/%E9%9D%92%E3%81%84%E7%A9%BA%E3%81%A8%E6%B5%9C%E6%9D%BE%E7%94%BA%E6%97%A5%E6%9C%AC%E3%81%A7%E6%99%B4%E3%82%8C%E3%81%9F%E6%97%A5%E3%81%AE%E4%B8%8B%E3%81%A7%E3%81%AE%E6%9D%B1%E4%BA%AC%E3%82%BF%E3%83%AF%E3%83%BC.jpg?s=2048x2048&w=is&k=20&c=B893-I7U1DOVp-ePN0fddjo_4Zk05ySED452ZaHbVaw=',
  ];

//firebaseから要素数を取得
  late final listlength = nameCardImage.length;

  late final List<bool> boolList = List.filled(listlength, true);

  void memoSave(int idx) {
    print(friendsmemo[idx]);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
