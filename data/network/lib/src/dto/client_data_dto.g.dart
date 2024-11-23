// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDataDTO _$ClientDataDTOFromJson(Map<String, dynamic> json) =>
    ClientDataDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phone: json['phone'] as String?,
      login: json['login'] as String?,
      walletId: json['walletId'] as String?,
      walletBalance: json['walletBalance'] as String?,
      workOrder: json['workOrder'] as String?,
      vehicle: json['vehicle'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      earnings: json['earnings'] as String?,
      outlay: json['outlay'] as String?,
    );

Map<String, dynamic> _$ClientDataDTOToJson(ClientDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
      'login': instance.login,
      'walletId': instance.walletId,
      'walletBalance': instance.walletBalance,
      'vehicleNumber': instance.vehicleNumber,
      'vehicle': instance.vehicle,
      'workOrder': instance.workOrder,
      'earnings': instance.earnings,
      'outlay': instance.outlay,
    };
