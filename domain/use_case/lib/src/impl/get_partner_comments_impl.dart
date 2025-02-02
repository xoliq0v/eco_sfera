import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

import '../get_partner_comments.dart';

class GetPartnerCommentsImpl implements GetPartnerComments {
  final PartnerRepo partnerProvider;

  GetPartnerCommentsImpl(this.partnerProvider);

  @override
  Future<Result<List<Comment>>> call() {
    return partnerProvider.getComments();
  }
}
