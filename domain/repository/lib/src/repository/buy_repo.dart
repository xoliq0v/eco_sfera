import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

abstract class BuyRepo extends BaseRepository {

  Future<Result<bool>> buy(BuyReq buyModel);

  Future<Result<List<TrashInfo>>> fetchParams();

}