import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetRegions {
  Future<Result<List<Region>>> get();
}