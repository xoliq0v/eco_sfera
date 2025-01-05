import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/model.dart';
import 'package:model/src/buy_model.dart';
import 'package:model/src/buy_page_prams_model.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/buy_use_case.dart';

class BuyImpl extends Buy {
  BuyImpl({required this.buyRepo});

  final BuyRepo buyRepo;

  @override
  Future<Result<bool>> buy(BuyModel buyModel) {
    return buyRepo.buy(buyModel);
  }

}

class FetchBuyParamsImpl extends FetchBuyPageParams {
  FetchBuyParamsImpl({required this.buyRepo});

  final BuyRepo buyRepo;

  @override
  Future<Result<List<TrashInfo>>> fetch() {
    return buyRepo.fetchParams();
  }

}