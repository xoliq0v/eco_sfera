import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history.freezed.dart';
part 'payment_history.g.dart';

@freezed
class PaymentHistory with _$PaymentHistory {
  const factory PaymentHistory({
    required DateTime date,
    required String description,
    required int amount,
  }) = _PaymentHistory;

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => _$PaymentHistoryFromJson(json);
}
