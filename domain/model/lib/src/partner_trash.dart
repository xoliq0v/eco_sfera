import 'package:core/core.dart';

class PartnerTrash extends Equatable {
  final int id;
  final String name;
  final String nameRu;
  final String nameEn;
  final String price;
  final int partnerId;
  final String createdAt;
  final String updatedAt;

  const PartnerTrash({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.nameEn,
    required this.price,
    required this.partnerId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, nameRu, nameEn, price, partnerId, createdAt, updatedAt];
}