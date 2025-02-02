import '../../database.dart';
import '../../objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class MyObjectBox {
  MyObjectBox._create(this.store);

  late final Store store;

  static Future<MyObjectBox> create() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: p.join(dbFolder.path),
      macosApplicationGroup: 'objectbox.jasco',
    );
    return MyObjectBox._create(store);
  }

  Future<void> closeSessions() {
    final tables = [
      store.box<DrugSearchEntity>(),
      store.box<FavoriteDetectorEntity>(),
      store.box<UserLocationEntity>(),
      store.box<DriverEntity>(),
    ];
    return Future.wait(tables.map((e) => e.removeAllAsync()));
  }
}
