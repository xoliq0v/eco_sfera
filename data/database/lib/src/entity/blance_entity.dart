import 'package:objectbox/objectbox.dart';

@Entity()
class BalanceEntity {
  @Id(assignable: true)
  int id = 0;
  double balance;

  BalanceEntity({required this.balance});
}
