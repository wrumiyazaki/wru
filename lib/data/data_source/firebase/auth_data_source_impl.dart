import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wru/data/data_source/firebase/auth_data_source.dart';
import 'package:wru/data/provider/firebase_auth_provider.dart';

final authDataSourceProvider = Provider((ref) => AuthDataSourceImpl(ref));

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl(this._ref);

  final Ref _ref;

  late final FirebaseAuth _firebaseAuth = _ref.read(firebaseAuthProvider);

  @override
  Future<User?> signUp(String email, String password) async {
    UserCredential credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = credential.user;
    return user;
  }

  @override
  Future<User?> signIn(String email, String password) async {
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = credential.user;
    return user;
  }
}
