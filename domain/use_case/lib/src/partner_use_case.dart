import 'package:model/model.dart';

abstract class FetchPartnerProfile {
  Future<int?> fetch();
}

abstract class GetPartnerProfile {
  PartnerInfoModel? get();

  Stream<PartnerInfoModel?> watch();
}