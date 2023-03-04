import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//要素数増やすならview_modelとListView(edit_page側は条件分岐もある)内も
class MapKey extends StatelessWidget {
  MapKey({super.key});

  String name = 'name';
  String namePhonetic = 'namePhonetic';
  String userID = 'userID';
  String birthday = 'birthday';
  String telePhoneNumber = 'telePhoneNumber';
  String email = 'email';
  String gender = 'gender';
  String belonging1 = 'belonging1';
  String belonging2 = 'belonging2';
  String belonging3 = 'belonging3';

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//firebaseからとってきたもの
Map getMap = {
  MapKey().name: '小林ゆうひ',
  MapKey().namePhonetic: 'kobaaydsasf',
  MapKey().userID: 'sdfaddas',
  MapKey().birthday: 'asdf',
  MapKey().telePhoneNumber: 'asdf',
  MapKey().email: 'asdf',
  MapKey().gender: 'asdf',
  MapKey().belonging1: 'asdf',
  MapKey().belonging2: 'asdf',
  MapKey().belonging3: 'asdf',
};
