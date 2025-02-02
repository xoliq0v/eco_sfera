import 'package:objectbox/objectbox.dart';

@Entity()
class PartnerEntity {
  @Id(assignable: true)
  int id;

  String latitude;
  String longitude;
  String? location;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  String province;
  String district;
  String address;
  bool isActive;
  bool status;
  String nickname;
  String fish;
  String comment;
  String login;
  String password;
  String trashes;
  String trashePrices;
  String? phone;
  String? about;

  PartnerEntity({
    this.id = 0, // Default to 0 for auto-increment
    required this.latitude,
    required this.longitude,
    this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.province,
    required this.district,
    required this.address,
    required this.isActive,
    required this.status,
    required this.nickname,
    required this.fish,
    required this.comment,
    required this.login,
    required this.password,
    required this.trashes,
    required this.trashePrices,
    this.phone,
    this.about,
  });
}
