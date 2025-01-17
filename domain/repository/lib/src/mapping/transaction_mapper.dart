import 'package:model/model.dart';
import 'package:network/network.dart';

extension TransactionMapper on DailyTransactionsDto {

  DailyTransactions toModel(){
    return DailyTransactions(
        transactions: transactions.map((item)=> item.toModel()).toList()
    );
  }

}

extension Tr on TransactionDto {

  Transaction toModel(){

    return Transaction(time: time, user: user, amount: amount.toString(), type: type, date: date);

  }

}

extension TransactionsResponseMapper on TransactionsResponseDto {

  TransactionsResponse toModel(){

    return TransactionsResponse(
        transactionsByDate: transactionsByDate.map((date,list){
          return MapEntry(date,list.toModel());
        })
    );
  }

}