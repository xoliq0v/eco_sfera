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
      wallet_balance: json['wallet_balance'] as String?,
      vehicle_mumber: json['vehicle_mumber'] as String?,
      vehicle: json['vehicle'] as String?,
      work_order: json['work_order'] as String?,
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
      'wallet_balance': instance.wallet_balance,
      'vehicle_mumber': instance.vehicle_mumber,
      'vehicle': instance.vehicle,
      'work_order': instance.work_order,
      'earnings': instance.earnings,
      'outlay': instance.outlay,
    };
