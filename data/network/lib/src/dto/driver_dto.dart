import 'package:core/core.dart';

part 'driver_dto.g.dart';

@JsonSerializable()
class DriverDTO {

  DriverDTO({
     this.id,
     this.name,
     this.surname,
     this.phone,
     this.login,
     this.password,
     this.walletId,
     this.walletBalance,
     this.workOrder,
     this.vehicle,
     this.vehicleNumber,
     this.earnings,
     this.outlay,
     this.createdAt,
     this.updatedAt,
     this.profileImage,
     this.patronymic,
     this.nickname,
     this.province,
     this.district,
     this.address,
     this.isActive,
     this.status,
  });

  // Factory for deserialization
  factory DriverDTO.fromJson(Map<String, dynamic> json) =>
      _$DriverDTOFromJson(json);
  final int? id;
  final String? name;
  final String? surname;
  final String? phone;
  final String? login;
  final String? password;
  @JsonKey(name: 'wallet_id')
  final int? walletId;
  @JsonKey(name: 'wallet_balance')
  final String? walletBalance;
  @JsonKey(name: 'work_order')
  final String? workOrder;
  final String? vehicle;
  @JsonKey(name: 'vehicle_number')
  final String? vehicleNumber;
  final int? earnings;
  final int? outlay;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  final String? patronymic;
  final String? nickname;
  final String? province;
  final String? district;
  final String? address;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  final bool? status;

  // Method for serialization
  Map<String, dynamic> toJson() => _$DriverDTOToJson(this);
}
