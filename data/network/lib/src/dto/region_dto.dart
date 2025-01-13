import 'package:core/core.dart';

part 'region_dto.g.dart';

@JsonSerializable()
class RegionDTO {

  RegionDTO({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  factory RegionDTO.fromJson(Map<String, dynamic> json) => _$RegionDTOFromJson(json);


}
