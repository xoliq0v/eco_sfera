import 'package:core/core.dart' hide Map;

import '../../network.dart';

part 'daily_transactions_dto.g.dart';

@JsonSerializable()
class DailyTransactionsDto {
  final List<TransactionDto> transactions;

  DailyTransactionsDto({required this.transactions});

  factory DailyTransactionsDto.fromJson(Map<String, dynamic> json) =>
      _$DailyTransactionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DailyTransactionsDtoToJson(this);
}
