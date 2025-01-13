import 'package:core/core.dart';

class PartnerItem extends Equatable {

  PartnerItem({
    required this.id,
    required this.comment,
    required this.nickName,
    required this.longitude,
    required this.latitude,
  });

  final int id;
  final String comment;
  final String nickName;
  final String longitude;
  final String latitude;

  @override
  List<Object?> get props => [id,comment,nickName,latitude,longitude];

}