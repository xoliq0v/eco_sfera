import 'package:core/core.dart' hide Map;

part 'customer_get_request.g.dart';

@JsonSerializable()
class CustomerGetRequestDTO {

   factory CustomerGetRequestDTO.fromJson(Map<String, dynamic> json) {
     return _$CustomerGetRequestDTOFromJson(json);
   }

   const CustomerGetRequestDTO({required this.size,required this.page});

   final int page;
   final int size;

   Map<String, dynamic> toJson() => _$CustomerGetRequestDTOToJson(this);

}