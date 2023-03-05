import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/data_source/firebase/firesotre/users_data_source.dart';
import 'package:wru/data/model/app_user/app_user.dart';
import 'package:wru/data/provider/firebase_firestore_provider.dart';

final usersDataSourceProvider = Provider((ref) => UsersDataSourceImpl(ref));

class UsersDataSourceImpl implements UsersDataSource {
  UsersDataSourceImpl(this._ref);
  final Ref _ref;
  late final FirebaseFirestore db = _ref.read(firebaseFirestoreProvider);
  final usersCollection = 'users';

  @override
  Future<void> create(AppUser appUser) {
    return db
        .collection(usersCollection)
        .doc(appUser.uid)
        .set(appUser.toJson());
  }

  @override
  Future<AppUser> fetch(String uid) async {
    final docRef = db.collection(usersCollection).doc(uid);
    DocumentSnapshot doc = await docRef.get();
    return AppUser.fromJson(doc.data() as Map<String, dynamic>);
  }
}
