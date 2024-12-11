import 'package:core/core.dart';

class Partner extends Equatable {

  const Partner({
    required this.id,
    required this.title,
    required this.description,
    required this.longitude,
    required this.latitude,
  });

  final int id;
  final String title;
  final String description;
  final String longitude;
  final String latitude;

  @override
  List<Object?> get props => [id,title,description,longitude,latitude];

}