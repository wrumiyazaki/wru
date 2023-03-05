import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/profile/profile.dart';
import 'package:wru/data/model/received_card/received_card.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  @JsonSerializable(explicitToJson: true)
  factory AppUser({
    required String uid,
    required String email,
    Profile? profile,
    List<Card>? myCards,
    List<ReceivedCard>? receivedCards,
  }) = _AppUser;

  factory AppUser.fromFirebaseUser(User firebaseUser) {
    return AppUser(
      uid: firebaseUser.uid,
      email: firebaseUser.email!,
    );
  }
}
