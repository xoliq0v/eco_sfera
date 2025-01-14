import 'package:equatable/equatable.dart';

class CustomerResponseModel extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String fullAddress;
  final bool isApproved;
  final bool isRegistered;
  final bool isVerified;
  final int regionId;
  final int id;

  const CustomerResponseModel({
    required this.id,
    required this.fullName,
    required this.fullAddress,
    required this.isApproved,
    required this.isVerified,
    required this.isRegistered,
    required this.regionId,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
    id,
    fullName,
    fullAddress,
    regionId,
    isRegistered,
    isApproved,
    isVerified,
    phoneNumber
  ];
}
