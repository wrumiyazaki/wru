import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeViewModel extends StatelessWidget {
  const HomeViewModel({super.key});

  //firebaseから取得する
  final String imageUrl = 'assets/img/namecard-sample.png';

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
