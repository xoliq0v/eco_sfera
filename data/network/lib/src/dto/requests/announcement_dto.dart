import 'package:core/core.dart';

part 'announcement_dto.g.dart';

@JsonSerializable()
class AnnouncementDto {
  AnnouncementDto({
    required this.number,
    required this.workTime,
    required this.description,
    required this.products,
  });

  final String number;
  @JsonKey(name: 'work_time')
  final String workTime;
  final String description;
  final List<AdTrashDto> products;

  factory AnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementDtoToJson(this);
}

@JsonSerializable()
class AdTrashDto {
  AdTrashDto({required this.trashId, required this.price});

  @JsonKey(name: 'trash_id')
  final int trashId;
  @JsonKey(name: 'price')
  final int price;

  factory AdTrashDto.fromJson(Map<String, dynamic> json) => _$AdTrashDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdTrashDtoToJson(this);
}
