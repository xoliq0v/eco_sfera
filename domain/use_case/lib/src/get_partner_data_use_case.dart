import 'package:model/model.dart';

abstract class GetPartnerDataUseCase {
  Future<PartnerData?> getPartnerData(int id);
}