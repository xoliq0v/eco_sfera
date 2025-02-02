import 'package:model/model.dart';
import 'package:network/network.dart';

extension CommentMapping on CommentDto {
  Comment toModel() {
    return Comment(
      id: id,
      description: description,
      partnerProductId: partnerProductId,
      partnerProduct: partnerProduct.toModel(),
    );
  }
}

extension PartnerProductMapping on PartnerProductDto {
  PartnerProduct toModel() {
    return PartnerProduct(
      id: id,
      name: name,
      nameRu: nameRu,
      nameEn: nameEn,
      price: price,
      partnerId: partnerId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
