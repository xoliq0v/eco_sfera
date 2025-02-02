import 'package:core/core.dart' hide Map;

part 'buy_check_dto.g.dart';

@JsonSerializable()
class BuyCheckDto {

  const BuyCheckDto({
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

  factory BuyCheckDto.fromJson(Map<String, dynamic> json){
    return _$BuyCheckDtoFromJson(json);
  }

  @JsonKey(name: 'employee_id')
  final int? employeeId;
  @JsonKey(name: 'user_id')
  final int? userId;
  final int? amount;
  @JsonKey(name: 'player_name')
  final String? payerName;
  @JsonKey(name: 'player_phone_number')
  final String? payerPhoneNumber;
  final String? address;
  @JsonKey(name: 'organization_phone_number')
  final String? organizationPhoneNumber;
  @JsonKey(name: 'organization_name')
  final String? organizationName;
  @JsonKey(name: 'organization_address')
  final String? organizationAddress;
  @JsonKey(name: 'branch_name')
  final String? branchName;
  @JsonKey(name: 'check_number')
  final String? checkNumber;
  final String? stir;
  @JsonKey(name: 'update_at')
  final DateTime? updatedAt;
  final int? id;
  final String? date;


}
