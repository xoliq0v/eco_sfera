import 'package:database/database.dart';
import 'package:objectbox/objectbox.dart';

class UserProfileDAO {
  UserProfileDAO(Store store) : _box = store.box<UserProfileEntity>();
  final Box<UserProfileEntity> _box;

  int saveProfile(UserProfileEntity userProfileEntity) {
    return _box.put(userProfileEntity);
  }

  UserProfileEntity? getProfile() {
    final builder = _box.query().build();
    final profile = builder.findFirst();
    builder.close();
    return profile;
  }

  Stream<UserProfileEntity?> watchProfile() {
    return _box.query().watch().map((event) {
      return event.findFirst();
    });
  }
}
