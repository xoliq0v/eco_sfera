import 'package:model/model.dart';
import 'package:network/network.dart';

extension ProductMapping on ProductDto {
  Product toModel() => Product(
        id: id,
        name: name ?? ''  ,
        nameRu: nameRu ?? '',
        nameEn: nameEn ?? '',
        price: price ?? '',
        partnerId: partnerId ?? 0,
        createdAt: createdAt ?? DateTime.now().toIso8601String(),
        updatedAt: updatedAt ?? DateTime.now().toIso8601String(),
      );
}
