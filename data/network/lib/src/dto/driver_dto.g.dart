// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverDTO _$DriverDTOFromJson(Map<String, dynamic> json) => DriverDTO(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phone: json['phone'] as String?,
      login: json['login'] as String?,
      password: json['password'] as String?,
      walletId: (json['wallet_id'] as num?)?.toInt(),
      walletBalance: json['wallet_balance'] as String?,
      workOrder: json['work_order'] as String?,
      vehicle: json['vehicle'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      earnings: (json['earnings'] as num?)?.toInt(),
      outlay: (json['outlay'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      profileImage: json['profile_image'] as String?,
      patronymic: json['patronymic'] as String?,
      nickname: json['nickname'] as String?,
      province: json['province'] as String?,
      district: json['district'] as String?,
      address: json['address'] as String?,
      isActive: json['is_active'] as bool?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$DriverDTOToJson(DriverDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
      'login': instance.login,
      'password': instance.password,
      'wallet_id': instance.walletId,
      'wallet_balance': instance.walletBalance,
      'work_order': instance.workOrder,
      'vehicle': instance.vehicle,
      'vehicle_number': instance.vehicleNumber,
      'earnings': instance.earnings,
      'outlay': instance.outlay,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'profile_image': instance.profileImage,
      'patronymic': instance.patronymic,
      'nickname': instance.nickname,
      'province': instance.province,
      'district': instance.district,
      'address': instance.address,
      'is_active': instance.isActive,
      'status': instance.status,
    };
