import 'package:core/core.dart';

class Region extends Equatable {

  final String name;
  final int id;

  Region({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    name
  ];

}