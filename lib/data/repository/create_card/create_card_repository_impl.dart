import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/model/received_card/received_card.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/provider/uid_provider.dart';
import 'package:wru/data/repository/create_card/create_card_repository.dart';
import 'package:wru/ui/create_card/create_card_view_model.dart';

final createCardRepositoryProvider =
    AutoDisposeProvider((ref) => CreateCardRepositoryImpl(ref));

class CreateCardRepositoryImpl implements CreateCardRepository {
  CreateCardRepositoryImpl(this._ref);

  final Ref _ref;
  late FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';
  final myCardsCollection = 'myCards';
  final List docList = [];
  late final uid = _ref.watch(uidProvider);
  late final myCardRef =
      db.collection(usersCollection).doc(uid).collection(myCardsCollection);
  late final createCard = _ref.watch(createCardViewModelProvider);
  late Map<String, dynamic> map;

  @override
  Future<void> save() async {
    //リストをマップにする
    for (int i = 0; i < createCard.selectedTemplate!.inputItems.length; i++) {
      map = {
        createCard.selectedTemplate!.inputItems[i].label:
            createCard.enteredInformations[i]
      };
    }

    myCardRef.get().then((snapshot) {
      //myCardsコレクションに入っているドキュメントのidを取得
      snapshot.docs.forEach(
        (doc) {
          docList.add(doc.id);
        },
      );
      //いままでにつくった名刺がない場合はドキュメントIDをつくって保存
      if (docList[0] != null) {
        myCardRef.doc().set(map);
      } else {
        myCardRef.doc(docList[1]).set(map);
      }
    });
  }
}
