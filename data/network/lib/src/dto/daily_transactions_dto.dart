import 'package:core/core.dart' hide Map;

import 'package:network/network.dart';

part 'daily_transactions_dto.g.dart';

@JsonSerializable()
class DailyTransactionsDto {

  DailyTransactionsDto({required this.transactions});

  factory DailyTransactionsDto.fromJson(Map<String, dynamic> json) =>
      _$DailyTransactionsDtoFromJson(json);
  final List<TransactionDto> transactions;

  Map<String, dynamic> toJson() => _$DailyTransactionsDtoToJson(this);
}
