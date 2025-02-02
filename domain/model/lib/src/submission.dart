import 'package:core/core.dart';

import 'requests/announcement.dart';

class Submission extends Equatable {
  final String driverName;
  final int partnerId;
  final List<AdTrash> products;
  final String comment;
  final String longitude;
  final String latitude;

  const Submission({
    required this.driverName,
    required this.partnerId,
    required this.comment,
    required this.products,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [driverName, partnerId, comment, longitude, latitude,products];
}