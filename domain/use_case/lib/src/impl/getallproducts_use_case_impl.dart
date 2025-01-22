import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../getallproducts_use_case.dart';

class GetAllProductsImpl extends GetAllProducts {
  GetAllProductsImpl({required this.partnerrepo});

  final PartnerRepo partnerrepo;

  @override
  Future<Result<List<Product>>> get() {
    return partnerrepo.getAllProducts();
  }
}