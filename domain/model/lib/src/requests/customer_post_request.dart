import 'package:core/core.dart';

class CustomerPostModel extends Equatable {
  CustomerPostModel({
    required this.fullName,
    required this.phone,
    required this.regionId,
    required this.address,
  });

  final String fullName;
  final String phone;
  final int regionId;
  final String address;

  @override
  List<Object?> get props => [
    fullName,
    phone,
    regionId,
    address
  ];

}