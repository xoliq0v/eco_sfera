import 'package:core/core.dart' hide Map;

part 'trash_dto.g.dart';

@JsonSerializable()
class TrashDto {
  TrashDto({required this.name, required this.price});

  factory TrashDto.fromJson(Map<String, dynamic> json){
    return _$TrashDtoFromJson(json);
  }

  final String name;
  final int price;
}