import 'dart:math';
import '../enum/location_access_state.dart';

class LocationResult {
  final Point? point;
  final double? accuracy;
  final LocationAccessState? errorState;
  final String? errorMessage;

  const LocationResult._({
    this.point,
    this.accuracy,
    this.errorState,
    this.errorMessage,
  });

  /// Successful location retrieval
  factory LocationResult.success({
    required Point point,
    double? accuracy,
  }) => LocationResult._(
    point: point,
    accuracy: accuracy,
  );

  /// Location retrieval error
  factory LocationResult.error({
    required LocationAccessState state,
    String? message,
  }) => LocationResult._(
    errorState: state,
    errorMessage: message,
  );

  /// Check if location was successfully retrieved
  bool get isSuccess => point != null;

  /// Check if there was an error
  bool get hasError => errorState != null;
}