import 'package:objectbox/objectbox.dart';

@Entity()
class FavoriteDetectorEntity {
  FavoriteDetectorEntity({
    required this.dateTime,
    this.id = 1,
  });

  @Id(assignable: true)
  int id;

  @Unique()
  final int dateTime;
}
