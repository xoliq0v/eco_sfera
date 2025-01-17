import 'package:core/core.dart';

class BuyCheckModel extends Equatable {
  final int employeeId;
  final int userId;
  final int amount;
  final String payerName;
  final String? payerPhoneNumber;
  final String? address;
  final String organizationPhoneNumber;
  final String organizationName;
  final String organizationAddress;
  final String branchName;
  final String checkNumber;
  final String stir;
  final DateTime updatedAt;
  final int id;
  final String date;

  const BuyCheckModel({
    required this.employeeId,
    required this.userId,
    required this.amount,
    required this.payerName,
    this.payerPhoneNumber,
    this.address,
    required this.organizationPhoneNumber,
    required this.organizationName,
    required this.organizationAddress,
    required this.branchName,
    required this.checkNumber,
    required this.stir,
    required this.updatedAt,
    required this.id,
    required this.date,
  });

  @override
  List<Object?> get props => [
    employeeId,
    userId,
    amount,
    payerName,
    payerPhoneNumber,
    address,
    organizationPhoneNumber,
    organizationName,
    organizationAddress,
    branchName,
    checkNumber,
    stir,
    updatedAt,
    id,
    date,
  ];
}
