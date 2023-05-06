import 'dart:typed_data';

abstract class CreateCardRepository {
  Future<void> save(String docId, Map<String, dynamic> map);
  Future<String> saveAndFetchStorageUrl(Uint8List uint8, String docId);
  Future<String> fetchDocId();
}
