import 'package:core/core.dart';

class LongLat extends Equatable {
  const LongLat({required this.long, required this.lat});

  final double long;
  final double lat;

  LongLat copyWith({
    double? long,
    double? lat,
  }) {
    return LongLat(
      long: long ?? this.long,
      lat: lat ?? this.lat,
    );
  }

  @override
  List<Object?> get props => [long, lat];
}

class UserLocation extends Equatable {
  const UserLocation({required this.position, required this.address});

  final LongLat position;
  final String address;

  UserLocation copyWith({
    LongLat? position,
    String? address,
  }) {
    return UserLocation(
      position: position ?? this.position,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [position, address];
}
