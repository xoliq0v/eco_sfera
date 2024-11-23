// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientInfoDTO _$ClientInfoDTOFromJson(Map<String, dynamic> json) =>
    ClientInfoDTO(
      id: (json['id'] as num).toInt(),
      phoneNumber: json['phoneNumber'] as String,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      login: json['login'] as String,
      lang: json['lang'] as String,
      walletId: json['walletId'] as String,
      walletBalance: json['walletBalance'] as String,
      workOrder: json['workOrder'] as String,
      vehicle: json['vehicle'] as String,
      vehicleNumber: json['vehicleNumber'] as String,
      earnings: json['earnings'] as String?,
      outlay: json['outlay'] as String?,
    );

Map<String, dynamic> _$ClientInfoDTOToJson(ClientInfoDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'surname': instance.surname,
      'lang': instance.lang,
      'walletId': instance.walletId,
      'walletBalance': instance.walletBalance,
      'workOrder': instance.workOrder,
      'vehicle': instance.vehicle,
      'vehicleNumber': instance.vehicleNumber,
      'earnings': instance.earnings,
      'outlay': instance.outlay,
      'login': instance.login,
    };
