// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentHistoryImpl _$$PaymentHistoryImplFromJson(Map<String, dynamic> json) =>
    _$PaymentHistoryImpl(
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$PaymentHistoryImplToJson(
        _$PaymentHistoryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'amount': instance.amount,
    };
