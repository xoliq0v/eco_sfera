import 'package:core/core.dart';

part 'client_data_dto.g.dart';

@JsonSerializable()
class ClientDataDTO {
  ClientDataDTO({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.login,
    required this.walletId,
    required this.wallet_balance,
    required this.vehicle_mumber,
    required this.vehicle,
    required this.work_order,
    required this.earnings,
    required this.outlay,
  });

  factory ClientDataDTO.fromJson(Map<String, dynamic> json) {
    return _$ClientDataDTOFromJson(json);
  }

  final int id;
  final String? name;
  final String? surname;
  final String? phone;
  final String? login;
  final String? walletId;
  final String? wallet_balance;
  final String? vehicle_mumber;
  final String? vehicle;
  final String? work_order;
  final String? earnings;
  final String? outlay;
}
