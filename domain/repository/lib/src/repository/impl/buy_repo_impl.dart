import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/model.dart';
import 'package:network/network.dart';
import '../../mapping/requests/buy_mapping.dart';
import '../buy_repo.dart';

import '../../mapping/buy_check_mapper.dart';
import '../../mapping/trash_mapping.dart';

class BuyRepoImpl extends BuyRepo {
  BuyRepoImpl({required this.buyProvider,required this.trashProvider});

  final BuyProvider buyProvider;
  final TrashProvider trashProvider;

  @override
  Future<Result<BuyCheckModel>> buy(BuyReq buyModel) async{
    final response = await buyProvider.buy(
      buyModel.toBuyDto()
    );

    try {
      if (!response.success || response.data == null) {
        return Result.error(
          ResultError(
            message: response.error?.message ?? 'Something went wrong',
            reason: response.error?.reason ?? 'Something went wrong',
          ),
        );
      }

      return Result.completed(response.data?.toModel());
    }catch(e){
      return Result.error(
        ResultError(
          message: 'Authentication failed',
          reason: e.toString(),
        ),
      );
    }

  }

  @override
  Future<Result<List<TrashInfo>>> fetchParams() {
    return toResult2(
        trashProvider.fetchTrashes(),
        fromSuccessResponse: (data){
          if(data.data == null) throw Exception("Field to fetch params");
          if(data.data!.isEmpty) throw Exception("Params is empty !");
          return data.data!.map((value){
            return value.toModel();
          }).toList();
        }
    );
  }



}