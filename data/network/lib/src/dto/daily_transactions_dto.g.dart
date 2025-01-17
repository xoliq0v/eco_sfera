// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_transactions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyTransactionsDto _$DailyTransactionsDtoFromJson(
        Map<String, dynamic> json) =>
    DailyTransactionsDto(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyTransactionsDtoToJson(
        DailyTransactionsDto instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };
