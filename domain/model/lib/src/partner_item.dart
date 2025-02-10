import 'package:core/core.dart';

class PartnerItem extends Equatable {
  PartnerItem({
    required this.id,
    required this.comment,
    required this.nickName,
    required this.longitude,
    required this.latitude,
    required this.phone,
    required this.status,
    required this.walletId,
    required this.walletBalance,
    this.distance
  });

  final int id;
  final String? comment;
  final String? nickName;
  final String? longitude;
  final String? latitude;
  final String? phone; // Nullable field
  final bool? status; // Nullable field
  final String? walletId; // Nullable field
  final String? walletBalance; // Nullable field
  String? distance;

  PartnerItem copyWith({
    int? id,
    String? comment,
    String? nickName,
    String? longitude,
    String? latitude,
    String? phone,
    bool? status,
    String? walletId,
    String? walletBalance,
    String? distance,
  }) {
    return PartnerItem(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      nickName: nickName ?? this.nickName,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      walletId: walletId ?? this.walletId,
      walletBalance: walletBalance ?? this.walletBalance,
      distance: distance ?? this.distance,
    );
  }

  @override
  List<Object?> get props => [
    id,
    comment,
    nickName,
    longitude,
    latitude,
    phone,
    status,
    walletId,
    walletBalance,
    distance        
  ];
}