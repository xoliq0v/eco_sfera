import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../getregions_use_case.dart';

class GetRegionsImpl extends GetRegions {
  GetRegionsImpl({required this.customerrepo});

  final CustomerRepository customerrepo;

  @override
  Future<Result<List<Region>>> get() {
    return customerrepo.getRegions();
  }
}