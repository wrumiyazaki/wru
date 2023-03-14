import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/repository/profile/profile_repository.dart';
import 'package:wru/ui/profile/profile_state.dart';
import 'package:wru/ui/profile/profile_view_model.dart';

final profileRepositoryProvider = Provider((ref) => ProfileRepositoryImpl(ref));

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._ref);
  final Ref _ref;
  final String usersCollection = 'users';
  final String profileField = 'profile';
  late final FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  late final DocumentReference profileRef =
      db.collection(usersCollection).doc(profileUid);

  @override
  Future<Map> fetchProfileMap() async {
    Map? documentMap;
    Map? profileMap;
    DocumentSnapshot? snapshot = await profileRef.get();
    documentMap = snapshot.data() as Map;
    if (documentMap[profileField] != null) {
      profileMap = documentMap[profileField];
    }
    return Future<Map>.value(profileMap);
  }

  void saveProfileMap(Map map, int index) {
    profileRef.update({
      '$profileField.${ProfileLists().profileKeyList[index]}':
          map[ProfileLists().profileKeyList[index]],
    });
  }
}
