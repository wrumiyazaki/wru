abstract class FriendRepository {
  Future<void> fetch();
  Future<void> saveMemo(int index, String? memo);
}
