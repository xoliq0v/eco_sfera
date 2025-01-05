import 'package:core/core.dart';

part 'trash_info_dto.g.dart';

@JsonSerializable()
class TrashInfoDto extends Equatable {

  const TrashInfoDto({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.nameKr,
    required this.key,
    required this.price,
  });

  factory TrashInfoDto.fromJson(Map<String, dynamic> json) => _$TrashInfoDtoFromJson(json);

  final int id;
  final String name;
  @JsonKey(name: 'name_ru')
  final String nameRu;
  @JsonKey(name: 'name_kr')
  final String nameKr;
  final String key;
  final String price;

  Map<String, dynamic> toJson() => _$TrashInfoDtoToJson(this);

  @override
  List<Object?> get props => [id, name, nameRu, nameKr, key, price];
}