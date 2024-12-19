import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/buy_dto.dart';

abstract class BuyProvider extends BaseProvider {

  Future<ApiResponse<bool>> buy(BuyDto buyDto);

}
