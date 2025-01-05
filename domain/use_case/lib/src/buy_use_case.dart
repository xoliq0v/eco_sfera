import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class Buy {

  Future<Result<bool>> buy(BuyModel buyModel);

}

abstract class FetchBuyPageParams{

  Future<Result<List<TrashInfo>>> fetch();

}