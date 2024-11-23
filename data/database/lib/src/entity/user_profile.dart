import 'package:objectbox/objectbox.dart';

@Entity()
class UserProfileEntity {
  UserProfileEntity({
    required this.name,
    required this.surname,
    required this.phone,
    required this.login,
    required this.walletId,
    required this.walletBalance,
    required this.workOrder,
    required this.vehicle,
    required this.vehicleNumber,
    required this.earnings,
    required this.outlay,
    this.id = 1,
  });

  @Id(assignable: true)
  int id;

  final String? name;
  final String? surname;
  final String? phone;
  final String? walletId;
  final String? walletBalance;
  final String? workOrder;
  final String? vehicle;
  final String? vehicleNumber;
  final String? earnings;
  final String? outlay;
  final String? login;
}
