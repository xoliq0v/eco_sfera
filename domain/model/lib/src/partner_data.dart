import 'package:core/core.dart';

class PartnerData extends Equatable {
  final int? id;
  final String? comment;
  final String? nickname;
  final String? longitude;
  final String? latitude;

  const PartnerData({
    required this.id,
    required this.comment,
    required this.nickname,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [id, comment, nickname, longitude, latitude];
}