// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    TransactionDto(
      time: json['time'] as String?,
      user: json['user'] as String?,
      amount: json['amount'],
      type: json['type'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$TransactionDtoToJson(TransactionDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'user': instance.user,
      'amount': instance.amount,
      'type': instance.type,
      'date': instance.date,
    };
