import 'package:core/core.dart' hide Map;

part 'customer_post_dto.g.dart';

@JsonSerializable()
class CustomerPostDTO {


  factory CustomerPostDTO.fromJson(Map<String, dynamic> json) {
    return _$CustomerPostDTOFromJson(json);
  }
  CustomerPostDTO({
    required this.fullName,
    required this.phone,
    required this.regionId,
    required this.address,
    this.pinfl = '',
  });

  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'phone_number')
  final String phone;
  @JsonKey(name: 'region_id')
  final int regionId;
  @JsonKey(name: 'full_address')
  final String address;
  final String? pinfl;

  Map<String, dynamic> toJson() => _$CustomerPostDTOToJson(this);

}