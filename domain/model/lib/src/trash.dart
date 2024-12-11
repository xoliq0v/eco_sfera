import 'package:core/core.dart';

class Trash extends Equatable {
  const Trash({required this.name,required this.price});

  final String name;
  final int price;

  @override
  List<Object?> get props => [name,price];
}