import 'dart:async';

import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:model/model.dart';
import 'package:network/network.dart';
import '../../mapping/pageable_content_mapping.dart';

import '../../mapping/comment_mapping.dart';
import '../../mapping/partner_data_mapper.dart';
import '../../mapping/partner_data_mapping.dart';
import '../../mapping/partner_edit_mapping.dart';
import '../../mapping/partner_item_mapping.dart';
import '../../mapping/partner_trash_mapping.dart';
import '../../mapping/product_mapping.dart';
import '../../mapping/requests/announcement_mapper.dart';
import '../../mapping/submission_mapping.dart';
import '../partner_repo.dart';

class PartnerRepoImpl extends PartnerRepo {
  PartnerRepoImpl({
    required this.partnerProvider,
    required this.partnerProfileDAO,
    required this.trashProvider,
  });

  final PartnerProvider partnerProvider;
  final PartnerProfileDAO partnerProfileDAO;
  final TrashProvider trashProvider;
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

  @override
  Future<Result<List<Product>>> getAllProducts() async {
    final response = await partnerProvider.getAllProducts();

    try {
      if (!response.success || response.data == null) {
        return Result.error(
          ResultError(
            message: response.error?.message ?? 'Something went wrong',
            reason: response.error?.reason ?? 'Something went wrong',
          ),
        );
      }

      return Result.completed(response.data?.map((e) => e.toModel()).toList() ?? []);
    } catch(e) {
      return Result.error(
        ResultError(
          message: 'Operation failed',
          reason: e.toString(),
        ),
      );
    }
  }
  
  @override
  Future<Result<List<PartnerTrash>>> fetchPartnerTrashes() {
    return toResult2(
      trashProvider.fetchPartnerTrashes(),
      fromSuccessResponse: (response) {
        return response.data?.map((e) => e.toDomain()).toList() ?? [];
      },
    );
  }

  @override
  Future<Result<bool>> changeTrashPrice(int trashId, String price) {
    return toResult2(
      trashProvider.changeTrashPrice(trashId, price),
      fromSuccessResponse: (response) {
        return response.data ?? false;
      },
    );
  }

  @override
  Future<Result<bool>> changeStatus(bool status) {
    return toResult2(
      partnerProvider.changeStatus(status),
      fromSuccessResponse: (response) {
        return response.data ?? false;
      },
    );
  }

  @override
  Future<Result<bool>> editPartner(PartnerEdit partnerEdit) {
    return toResult2(
      partnerProvider.editPartner(partnerEdit.toDto()),
      fromSuccessResponse: (response) {
        return response.data ?? false;
      },
    );
  }

  @override
  Future<Result<bool>> addComment(int productId, String comment) {
    return toResult2(
      trashProvider.addComment(productId, comment),
      fromSuccessResponse: (response) {
        return response.data ?? false;
      },
    );
  }

  @override
  Future<Result<PartnerData?>> getPartnerData(int id) {
    return toResult2(
      partnerProvider.getPartnerData(id),
      fromSuccessResponse: (response) {
        return response.data?.toModel();
      },
    );
  }

  @override
  Future<Result<bool>> createOrder(Submission submission) {
    return toResult2(
      partnerProvider.createOrder(submission.toDto()),
      fromSuccessResponse: (response) {
        return response.data ?? false;
      },
    );
  }

  @override
  Future<Result<List<Comment>>> getComments() {
    return toResult2(
      partnerProvider.getComments(),
      fromSuccessResponse: (response) {
        return response.data?.map((e) => e.toModel()).toList() ?? [];
      },
    );
  }
  
  @override
  Future<Result<bool>> postAd(Announcement announcement) {
    return toResult2(
      partnerProvider.postAd(announcement.toDto()),
      fromSuccessResponse: (response) {
        return response.data ?? false;
      },
    );
  }
}
