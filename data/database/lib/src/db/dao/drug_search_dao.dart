import 'package:database/src/entity/drug_search.dart';
import 'package:objectbox/objectbox.dart';

class DrugSearchDAO {
  DrugSearchDAO(Store store) : _box = store.box<DrugSearchEntity>();
  final Box<DrugSearchEntity> _box;

  bool saveDrug(String name) {
    try {
      _box.put(DrugSearchEntity(name: name));
      return true;
    } catch (e) {
      return false;
    }
  }

  List<DrugSearchEntity> getDrugs() {
    final builder = _box.query().build();
    final drugs = builder.find();
    builder.close();
    return drugs;
  }

  Stream<List<DrugSearchEntity>> watchDrugs() {
    return _box.query().watch().map((event) => event.find());
  }

  int clearDrugs() {
    return _box.removeAll();
  }
}
