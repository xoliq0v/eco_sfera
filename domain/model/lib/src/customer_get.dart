import 'package:core/core.dart';

class CustomerGetModel extends Equatable {
  const CustomerGetModel({required this.page,required this.size});
  final int size;
  final int page;

  @override
  List<Object?> get props => [size,page];
}