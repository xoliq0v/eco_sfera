import '../../../database.dart';
import '../../../objectbox.g.dart';

class BalanceDao {
  BalanceDao(Store store) : _box = store.box<BalanceEntity>();
  final Box<BalanceEntity> _box;

  int saveBalance(double balance) {
    // First try to get existing balance
    final existingBalance = _box.query().build().findFirst();

    if (existingBalance != null) {
      // Update existing balance
      existingBalance.balance = balance;
      return _box.put(existingBalance);
    } else {
      // Create new balance entity
      final entity = BalanceEntity(balance: balance);
      return _box.put(entity);
    }
  }

  double? getBalance() {
    final entity = _box.query().build().findFirst();
    return entity?.balance;
  }

  Stream<double?> watchBalance() {
    return _box.query().watch().map((event) {
      final entity = event.findFirst();
      return entity?.balance;
    });
  }
}