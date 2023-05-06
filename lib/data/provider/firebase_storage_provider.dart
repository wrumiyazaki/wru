import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storageRefProvider = Provider((_) => FirebaseStorage.instance.ref());
