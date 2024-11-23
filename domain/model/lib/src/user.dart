import 'package:core/core.dart';

class UserProfile extends Equatable {
  const UserProfile({
    required this.cId,
    required this.name,
    required this.surname,
    required this.phone,
    required this.phoneUI,
    required this.login,
    required this.wallet_id,
    required this.wallet_balance,
    required this.work_order,
    required this.vehicle,
    required this.vehicle_number,
    required this.earnings,
    required this.outlay,
  });

  final int cId;
  final String? name;
  final String? surname;
  final String? phone;
  final String? phoneUI;
  final String? login;
  final String? wallet_id;
  final String? wallet_balance;
  final String? work_order;
  final String? vehicle;
  final String? vehicle_number;
  final String? earnings;
  final String? outlay;

  @override
  List<Object?> get props {
    return [
      cId,
      name,
      surname,
      phone,
      phoneUI,
      login,
      wallet_id,
      wallet_balance,
      work_order,
      vehicle,
      vehicle_number,
      earnings,
      outlay
    ];
  }
}
