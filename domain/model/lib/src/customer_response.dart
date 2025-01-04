import 'package:equatable/equatable.dart';

class CustomerResponseModel extends Equatable {
  final String name;
  final String surname;
  final String gender;
  final String phone;
  final String birthDate;
  final String address;
  final String updatedAt;
  final String createdAt;
  final int id;

  const CustomerResponseModel({
    required this.name,
    required this.surname,
    required this.gender,
    required this.phone,
    required this.birthDate,
    required this.address,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @override
  List<Object?> get props => [
    name,
    surname,
    gender,
    phone,
    birthDate,
    address,
    updatedAt,
    createdAt,
    id,
  ];
}
