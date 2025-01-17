// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_check_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyCheckDto _$BuyCheckDtoFromJson(Map<String, dynamic> json) => BuyCheckDto(
      employeeId: (json['employee_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      payerName: json['player_name'] as String?,
      payerPhoneNumber: json['player_phone_number'] as String?,
      address: json['address'] as String?,
      organizationPhoneNumber: json['organization_phone_number'] as String?,
      organizationName: json['organization_name'] as String?,
      organizationAddress: json['organization_address'] as String?,
      branchName: json['branch_name'] as String?,
      checkNumber: json['check_number'] as String?,
      stir: json['stir'] as String?,
      updatedAt: json['update_at'] == null
          ? null
          : DateTime.parse(json['update_at'] as String),
      id: (json['id'] as num?)?.toInt(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$BuyCheckDtoToJson(BuyCheckDto instance) =>
    <String, dynamic>{
      'employee_id': instance.employeeId,
      'user_id': instance.userId,
      'amount': instance.amount,
      'player_name': instance.payerName,
      'player_phone_number': instance.payerPhoneNumber,
      'address': instance.address,
      'organization_phone_number': instance.organizationPhoneNumber,
      'organization_name': instance.organizationName,
      'organization_address': instance.organizationAddress,
      'branch_name': instance.branchName,
      'check_number': instance.checkNumber,
      'stir': instance.stir,
      'update_at': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'date': instance.date,
    };
