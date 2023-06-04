import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  @JsonSerializable(explicitToJson: true)
  factory AppUser({
    required String uid,
    required String email,
    Map? profile,
  }) = _AppUser;

  factory AppUser.fromFirebaseUser(User firebaseUser) {
    return AppUser(
        uid: firebaseUser.uid, email: firebaseUser.email!, profile: {});
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
