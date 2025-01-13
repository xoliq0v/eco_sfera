import 'dart:async';

import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:model/model.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/pageable_content_mapping.dart';

import '../../mapping/partner_data_mapper.dart';
import '../../mapping/partner_item_mapping.dart';
import '../partner_repo.dart';

class PartnerRepoImpl extends PartnerRepo {
  PartnerRepoImpl({
    required this.partnerProvider,
    required this.partnerProfileDAO,
  });

  final PartnerProvider partnerProvider;
  final PartnerProfileDAO partnerProfileDAO;

  @override
  Future<int?> fetchPartnerInfo() async{
    final res = await partnerProvider.fetchPartnerData();
    if (res.data == null) return null;
    return partnerProfileDAO.saveProfile(
      res.data!.toEntity(),
    );
  }

  @override
  PartnerInfoModel? getPartnerProfile() {
    return partnerProfileDAO.getProfile()?.toUserProfile();
  }


  @override
  Stream<PartnerInfoModel?> watchPartnerProfile() {
    return partnerProfileDAO.watchProfile().map((event) {
      return event?.toUserProfile();
    });
  }

  @override
  Future<Result<BasePaginatedResponse<PartnerItem>?>> fetchPartners(int page, int size) async {
    return toResult2(
      partnerProvider.fetchPartners(
          page,size
      ),
      fromSuccessResponse: (response) {
        return response.data?.toBasePaginatedResponse(contentMapper: (json) {
          final data = json as PartnerDto;
          return data.toModel();
        });
      },
    );
  }
}