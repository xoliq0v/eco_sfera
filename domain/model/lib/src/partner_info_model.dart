import 'package:core/core.dart';

class PartnerInfoModel extends Equatable {
  final int id;
  final String latitude;
  final String longitude;
  final String? location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String province;
  final String district;
  final String address;
  final bool isActive;
  final bool status;
  final String nickname;
  final String fish;
  final String comment;
  final String login;
  final String password;
  final String trashes;
  final String trashePrices;
  final String? phone;

  PartnerInfoModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.province,
    required this.district,
    required this.address,
    required this.isActive,
    required this.status,
    required this.nickname,
    required this.fish,
    required this.comment,
    required this.login,
    required this.password,
    required this.trashes,
    required this.trashePrices,
    this.phone,
  });

  @override
  List<Object?> get props => [
    id,
    latitude,
    longitude,
    location,
    createdAt,
    updatedAt,
    province,
    district,
    address,
    isActive,
    status,
    nickname,
    fish,
    comment,
    login,
    password,
    trashes,
    trashePrices,
    phone,
  ];
}