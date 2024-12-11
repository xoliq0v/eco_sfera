import 'package:core/core.dart';

class CustomerPostModel extends Equatable {
  CustomerPostModel({
    required this.name,
    required this.surname,
    required this.middleName,
    required this.phone,
    required this.birthDay,
    required this.gender,
    required this.address,
  });

  final String name;
  final String surname;
  final String middleName;
  final String phone;
  final String birthDay;
  final String gender;
  final String address;

  @override
  List<Object?> get props => [
    name,
    surname,
    middleName,
    phone,
    birthDay,
    gender,
    address
  ];

}