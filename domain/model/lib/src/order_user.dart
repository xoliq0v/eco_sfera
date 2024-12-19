import 'package:core/core.dart';

class OrderUser extends Equatable {

  OrderUser({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  final int id;
  final String name;
  final String phoneNumber;

  @override
  List<Object?> get props => [id,name,phoneNumber];

}