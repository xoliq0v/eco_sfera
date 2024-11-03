import 'package:objectbox/objectbox.dart';

@Entity()
class UserProfileEntity {
  UserProfileEntity({
    required this.cId,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.lang,
    this.id = 1,
  });

  @Id(assignable: true)
  int id;

  final int cId;
  final String phoneNumber;
  final String? firstName;
  final String? lastName;
  final String lang;
}
