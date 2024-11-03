import 'package:database/database.dart';
import 'package:objectbox/objectbox.dart';

class FavoriteDetectorDAO {
  FavoriteDetectorDAO(Store store) : _box = store.box<FavoriteDetectorEntity>();
  final Box<FavoriteDetectorEntity> _box;

  bool change(FavoriteDetectorEntity entity) {
    try {
      _box.put(entity);
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<FavoriteDetectorEntity?> watchChange() {
    return _box.query().watch().map((event) {
      return event.findFirst();
    });
  }
}
