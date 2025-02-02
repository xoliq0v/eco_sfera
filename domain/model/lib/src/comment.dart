import 'package:core/core.dart';

import '../model.dart';

class Comment extends Equatable {
  final int id;
  final String description;
  final int partnerProductId;
  final PartnerProduct partnerProduct;

  const Comment({
    required this.id,
    required this.description,
    required this.partnerProductId,
    required this.partnerProduct,
  });

  @override
  List<Object?> get props => [id, description, partnerProductId, partnerProduct];
}