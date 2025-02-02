import 'package:core/core.dart';
import 'package:model/model.dart';

import '../../repository.dart';

abstract class PartnerRepo extends BaseRepository {

  // Future<Result<BasePaginatedResponse<Partner>>> fetchPartner();

  // Future<Result<BasePaginatedResponse<Partner>>> searchPartnerByName();

  Future<int?> fetchPartnerInfo();

  PartnerInfoModel? getPartnerProfile();

  Stream<PartnerInfoModel?> watchPartnerProfile();

  Future<Result<BasePaginatedResponse<PartnerItem>?>> fetchPartners(int page,int size);

  Future<Result<List<Product>>> getAllProducts();

  Future<Result<List<PartnerTrash>>> fetchPartnerTrashes();

  Future<Result<bool>> changeTrashPrice(int trashId, String price);

  Future<Result<bool>> changeStatus(bool status);

  Future<Result<bool>> editPartner(PartnerEdit partnerEdit);

  Future<Result<bool>> addComment(int productId, String comment);

  Future<Result<PartnerData?>> getPartnerData(int id);

  Future<Result<bool>> createOrder(Submission submission);

  Future<Result<List<Comment>>> getComments();

  Future<Result<bool>> postAd(Announcement announcement);
}

