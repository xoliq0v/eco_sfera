import 'package:core/core.dart';

class DriverData extends Equatable {
  final int id;
  final String name;
  final String surname;
  final String phone;
  final String login;
  final String password;
  final int walletId;
  final String walletBalance;
  final String workOrder;
  final String vehicle;
  final String vehicleNumber;
  final String? earnings;
  final String? outlay;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? profileImage;
  final String patronymic;
  final String nickname;
  final String province;
  final String district;
  final String address;
  final bool isActive;
  final bool status;

  DriverData({
    required this.id,
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

  @override
  List<Object?> get props => [
    id,
    name,
    surname,
    phone,
    login,
    password,
    walletId,
    walletBalance,
    workOrder,
    vehicle,
    vehicleNumber,
    earnings,
    outlay,
    createdAt,
    updatedAt,
    profileImage,
    patronymic,
    nickname,
    province,
    district,
    address,
    isActive,
    status,
  ];
}
