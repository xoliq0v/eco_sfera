import 'package:objectbox/objectbox.dart';

@Entity()
class DrugSearchEntity {
  DrugSearchEntity({
    required this.name,
    this.id = 0,
  });

  @Id()
  int id;

  @Unique()
  final String name;
}
