import 'package:core/core.dart';

import 'package:network/src/dto/daily_transactions_dto.dart';

@JsonSerializable()
class TransactionsResponseDto {

  TransactionsResponseDto({required this.transactionsByDate});

  factory TransactionsResponseDto.fromJson(Map<String, dynamic> json) {
    return TransactionsResponseDto(
      transactionsByDate: json.map(
            (key, value) =>
            MapEntry(key, DailyTransactionsDto.fromJson(value as Map<String,dynamic>)),
      ),
    );
  }
  final Map<String, DailyTransactionsDto> transactionsByDate;

  Map<String, dynamic> toJson() => transactionsByDate.map(
        (key, value) => MapEntry(key, value.toJson()),
  );
}
