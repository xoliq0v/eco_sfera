import 'package:model/model.dart';
import 'package:network/network.dart';

extension PartnerTrashMapping on PartnerTrashDto {
  PartnerTrash toDomain() {
    return PartnerTrash(id: id, name: name, nameRu: nameRu, nameEn: nameEn, price: price, partnerId: partnerId, createdAt: createdAt, updatedAt: updatedAt);
  }
}