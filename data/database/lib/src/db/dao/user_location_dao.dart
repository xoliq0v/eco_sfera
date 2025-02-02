import '../../../database.dart';
import 'package:objectbox/objectbox.dart';

class UserLocationDAO {
  UserLocationDAO(Store store) : _box = store.box<UserLocationEntity>();
  final Box<UserLocationEntity> _box;

  int saveLocation(UserLocationEntity userLocationEntity) {
    return _box.put(userLocationEntity);
  }

  UserLocationEntity? getLocation() {
    final builder = _box.query().build();
    final location = builder.findFirst();
    builder.close();
    return location;
  }

  Stream<UserLocationEntity?> watchLocation() {
    return _box.query().watch().map((event) {
      return event.findFirst();
    });
  }
}
