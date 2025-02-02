

import 'package:core/core.dart' hide Map;

part 'transaction_dto.g.dart';

@JsonSerializable()
class TransactionDto {

  TransactionDto({
    required this.time,
    required this.user,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory TransactionDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDtoFromJson(json);
  final String? time;
  final String? user;
  final dynamic amount;
  final String? type;
  final String? date;

  Map<String, dynamic> toJson() => _$TransactionDtoToJson(this);
}

