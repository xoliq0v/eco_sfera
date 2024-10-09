import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auto_route/auto_route.dart';

part 'navigation_params.freezed.dart';

@freezed
class NavigationParams with _$NavigationParams {
  const factory NavigationParams({
    required List<String> svg,
    required List<String> labels,
    required List<PageRouteInfo<dynamic>> page,
  }) = _NavigationParams;

}