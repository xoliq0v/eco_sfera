import '../../../database.dart';
import 'package:objectbox/objectbox.dart';

class UserProfileDAO {
  UserProfileDAO(Store store) : _box = store.box<DriverEntity>();
  final Box<DriverEntity> _box;

  int saveProfile(DriverEntity userProfileEntity) {
    return _box.put(userProfileEntity);
  }

  DriverEntity? getProfile() {
    final builder = _box.query().build();
    final profile = builder.findFirst();
    builder.close();
    return profile;
  }

  Stream<DriverEntity?> watchProfile() {
    return _box.query().watch().map((event) {
      return event.findFirst();
    });
  }
}
