// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerDto _$PartnerDtoFromJson(Map<String, dynamic> json) => PartnerDto(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String?,
      comment: json['about'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      phone: json['phone'] as String?,
      fish: json['fish'] as String?,
      status: json['status'] as bool?,
      profileImage: json['profile_image'] as String?,
      earnings: json['earnings'] as String?,
      outlay: json['outlay'] as String?,
      walletId: json['wallet_id'] as String?,
      walletBalance: json['wallet_balance'] as String?,
    );

Map<String, dynamic> _$PartnerDtoToJson(PartnerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'about': instance.comment,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'phone': instance.phone,
      'fish': instance.fish,
      'status': instance.status,
      'profile_image': instance.profileImage,
      'earnings': instance.earnings,
      'outlay': instance.outlay,
      'wallet_id': instance.walletId,
      'wallet_balance': instance.walletBalance,
    };
