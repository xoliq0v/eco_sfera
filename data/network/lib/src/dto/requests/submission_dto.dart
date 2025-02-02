import 'package:core/core.dart';
import 'package:network/src/dto/requests/announcement_dto.dart';

part 'submission_dto.g.dart';

@JsonSerializable()
class SubmissionDto {

  const SubmissionDto({
    required this.driverName,
    required this.partnerId,
    required this.comment,
    required this.longitude,
    required this.latitude,
    required this.products,
  });

  factory SubmissionDto.fromJson(Map<String, dynamic> json) => _$SubmissionDtoFromJson(json);
  @JsonKey(name: 'driver_name')
  final String driverName;
  @JsonKey(name: 'partner_id')
  final int partnerId;
  final List<SubmissionDtoItem> products;
  final String comment;
  final String longitude;
  final String latitude;
  Map<String, dynamic> toJson() => _$SubmissionDtoToJson(this);
}

@JsonSerializable()
class SubmissionDtoItem {
  SubmissionDtoItem({
    required this.trashId,
    required this.volume,
  });
  @JsonKey(name: 'trash_id')
  final String trashId;
  final String volume;
  Map<String, dynamic> toJson() => _$SubmissionDtoItemToJson(this);
  factory SubmissionDtoItem.fromJson(Map<String, dynamic> json) => _$SubmissionDtoItemFromJson(json);
}