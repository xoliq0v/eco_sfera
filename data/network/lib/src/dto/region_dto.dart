import 'package:core/core.dart';

part 'region_dto.g.dart';

@JsonSerializable()
class RegionDTO {

  factory RegionDTO.fromJson(Map<String, dynamic> json) => _$RegionDTOFromJson(json);

  RegionDTO({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;


}
