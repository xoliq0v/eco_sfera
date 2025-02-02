
abstract class FetchBalance{
  Future<int?> fetch();
}

abstract class GetBalance {
  Stream<double?> watch();
  double? get();
}