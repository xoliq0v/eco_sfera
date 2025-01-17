import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class FetchBalance{
  Future<int?> fetch();
}

abstract class GetBalance {
  Stream<double?> watch();
  double? get();
}