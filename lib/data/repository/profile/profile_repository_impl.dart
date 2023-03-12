import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';
import 'package:wru/data/repository/profile/profile_repository.dart';
import 'package:wru/ui/profile/profile_view_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._ref);
  final Ref _ref;
  final String usersCollection = 'users';
  final String profileField = 'profile';
  late final FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  late final DocumentReference profileRef =
      db.collection(usersCollection).doc(profileUid);
  final profileMapProvider = StateNotifierProvider<ProfileMapNotifier, Map?>(
      (ref) => ProfileMapNotifier());

  @override
  Future<void> fetchProfileMap() async {
    Map? profileMap;
    profileRef.snapshots().listen(
      (event) async {
        final Map documentMap = event.data() as Map;
        if (documentMap[profileField] != null) {
          profileMap = documentMap[profileField];
          Provider(
            (ref) {
              ref.read(profileMapProvider.notifier).getProfileMap(profileMap);
            },
          );
        }
        print(profileMap);
      },
      onError: (e) => print('error'),
    );
  }
}
