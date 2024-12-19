import 'package:core/core.dart' hide Map;

part 'trash_dto.g.dart';

@JsonSerializable()
class TrashDto {
  TrashDto({required this.key, required this.price});

  factory TrashDto.fromJson(Map<String, dynamic> json){
    return _$TrashDtoFromJson(json);
  }

  final String key;
  final int price;
}