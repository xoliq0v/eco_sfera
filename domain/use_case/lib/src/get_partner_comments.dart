import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetPartnerComments {
  Future<Result<List<Comment>>> call();
}
