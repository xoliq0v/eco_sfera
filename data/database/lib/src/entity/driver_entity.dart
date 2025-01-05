import 'package:objectbox/objectbox.dart';

@Entity()
class DriverEntity {
  @Id(assignable: true)
  int id;

  String name;
  String surname;
  String phone;
  String login;
  String password;
  int walletId;
  String walletBalance;
  String workOrder;
  String vehicle;
  String vehicleNumber;
  int? earnings;
  int? outlay;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  String? profileImage;
  String patronymic;
  String nickname;
  String province;
  String district;
  String address;
  bool isActive;
  bool status;

  DriverEntity({
    this.id = 0, // Default to 0 for auto-increment
    required this.name,
    required this.surname,
    required this.phone,
    required this.login,
    required this.password,
    required this.walletId,
    required this.walletBalance,
    required this.workOrder,
    required this.vehicle,
    required this.vehicleNumber,
    this.earnings,
    this.outlay,
    required this.createdAt,
    required this.updatedAt,
    this.profileImage,
    required this.patronymic,
    required this.nickname,
    required this.province,
    required this.district,
    required this.address,
    required this.isActive,
    required this.status,
  });
}
