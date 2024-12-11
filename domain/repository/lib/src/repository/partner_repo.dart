import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

abstract class PartnerRepo extends BaseRepository{

  Future<Result<BasePaginatedResponse<Partner>>> fetchPartner();

  Future<Result<BasePaginatedResponse<Partner>>> searchPartnerByName();


}