import 'package:objectbox/objectbox.dart';

@Entity()
class UserLocationEntity {
  UserLocationEntity({
    required this.latitude,
    required this.longitude,
    required this.address,
    this.id = 1,
  });

  @Id(assignable: true)
  int id;

  final double latitude;
  final double longitude;
  final String address;
}
