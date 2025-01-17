import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class BuyProvider extends BaseProvider {

  Future<ApiResponse<BuyCheckDto>> buy(BuyReqDto buyDto);

}
