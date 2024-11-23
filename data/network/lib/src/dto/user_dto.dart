import 'package:core/core.dart' hide Map;

part 'user_dto.g.dart';

@JsonSerializable()
class ClientInfoDTO {
  ClientInfoDTO({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.surname,
    required this.login,
    required this.lang,
    required this.walletId,
    required this.walletBalance,
    required this.workOrder,
    required this.vehicle,
    required this.vehicleNumber,
    required this.earnings,
    required this.outlay,
  });

  factory ClientInfoDTO.fromJson(Map<String, dynamic> json) {
    return _$ClientInfoDTOFromJson(json);
  }

  final int id;
  final String phoneNumber;
  final String? name;
  final String? surname;
  final String lang;
  final String walletId;
  final String walletBalance;
  final String workOrder;
  final String vehicle;
  final String vehicleNumber;
  final String? earnings;
  final String? outlay;
  final String login;
}