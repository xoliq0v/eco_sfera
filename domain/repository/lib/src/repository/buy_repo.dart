import 'package:core/core.dart';
import 'package:model/model.dart';
import '../../repository.dart';

abstract class BuyRepo extends BaseRepository {

  Future<Result<BuyCheckModel>> buy(BuyReq buyModel);

  Future<Result<List<TrashInfo>>> fetchParams();

}