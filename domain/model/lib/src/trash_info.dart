import 'package:equatable/equatable.dart';

class TrashInfo extends Equatable {
  final int id;
  final String name;
  final String nameRu;
  final String nameKr;
  final String key;
  final double price;

  const TrashInfo({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.nameKr,
    required this.key,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, nameRu, nameKr, key, price];
}