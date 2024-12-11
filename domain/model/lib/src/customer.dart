import 'package:core/core.dart';

class Customer extends Equatable {
  const Customer({
    required this.id,
    required this.name,
    required this.surname,
  });

  final int id;
  final String name;
  final String surname;


  @override
  List<Object?> get props => [
    id,
    name,
    surname
  ];
}