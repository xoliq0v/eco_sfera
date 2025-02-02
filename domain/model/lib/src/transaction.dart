import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String? time;
  final String? user;
  final String? amount;
  final String? type;
  final String? date;

  const Transaction({
    required this.time,
    required this.user,
    required this.amount,
    required this.type,
    required this.date,
  });

  @override
  List<Object?> get props => [time, user, amount, type, date];
}

class DailyTransactions extends Equatable {
  final List<Transaction> transactions;

  const DailyTransactions({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

class TransactionsResponse extends Equatable {
  final Map<String, DailyTransactions> transactionsByDate;

  const TransactionsResponse({required this.transactionsByDate});


  @override
  List<Object?> get props => [transactionsByDate];
}
