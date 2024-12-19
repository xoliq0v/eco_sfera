import 'package:core/core.dart';

class TrashParamModel extends Equatable {
  TrashParamModel({
    required this.key,
    required this.price
  });

  final String key;
  final int price;

  @override
  List<Object?> get props => [key,price];

}