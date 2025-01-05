import 'dart:async';

import 'package:database/database.dart';
import 'package:model/model.dart';
import 'package:network/network.dart';

import '../../mapping/partner_data_mapper.dart';
import '../partner_repo.dart';

class PartnerRepoImpl implements PartnerRepo {
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
}