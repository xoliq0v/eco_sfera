import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'partner_pagination_state.dart';

class PartnerPaginationCubit extends Cubit<PartnerPaginationState> with PaginationCubitWrapper {
  PartnerPaginationCubit(
    this._fetchPartners, {
    required int initialPageSize,
  }) : super(const PartnerPaginationState()) {
    localInitialPageSize = initialPageSize;
    _initializeLocation();
    fetchHistory();
  }

  final FetchPartners _fetchPartners;
  Location? _cachedLocation;
  bool _isLoadingLocation = false;
  final _searchDebouncer = Debouncer(milliseconds: 300);
  
  // Cache calculated distances to avoid recalculating
  final Map<String, String> _distanceCache = {};

  Future<void> _initializeLocation() async {
    try {
      _isLoadingLocation = true;
      _cachedLocation = await _getUserLocation();
    } catch (e) {
      // Handle location error silently but continue loading partners
    } finally {
      _isLoadingLocation = false;
    }
  }

  String _calculateDistanceWithCache(PartnerItem partner) {
    final key = '${partner.latitude}-${partner.longitude}';
    if (_distanceCache.containsKey(key)) {
      return _distanceCache[key]!;
    }

    if (_cachedLocation == null) return '0.00';

    final distance = calculateDistance(
      _cachedLocation!.latitude,
      _cachedLocation!.longitude,
      double.parse(partner.latitude??'0'),
      double.parse(partner.longitude??'0'),
    );
    
    final formattedDistance = distance.toStringAsFixed(2);
    _distanceCache[key] = formattedDistance;
    return formattedDistance;
  }

  Future<Location> _getUserLocation() async {
  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, prompt the user to enable them
    throw Exception('Location services are disabled.');
  }

  // Check location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Request permission if not granted
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are permanently denied, handle accordingly
    throw Exception('Location permissions are permanently denied.');
  }

  // Get the current position
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high, // Use high accuracy
  );

  // Return the location
  return Location(
    latitude: position.latitude,
    longitude: position.longitude,
  );
}

  Future<bool?> fetchHistory() async {
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    
    if (!isLoaded) {
      emit(state.copyWith(isLoadingShimmer: true));
    } else if (state.history.isNotEmpty) {
      emit(state.copyWith(isLoadingPagination: true));
    }
    
    return _fetch();
  }

  Future<bool?> refresh() async {
    if (state.isLoadingPagination || state.isLoadingShimmer) return null;
    
    localCurrentPage = 0;
    _distanceCache.clear();
    return _fetch(isRefresh: true);
  }

  void updateSearchQuery(String query) {
    _searchDebouncer.run(() {
      final filtered = _applySearchFilter(state.history, query);
      emit(state.copyWith(
        searchQuery: query,
        filteredHistory: filtered,
      ));
    });
  }

  List<PartnerItem> _applySearchFilter(List<PartnerItem> partners, String query) {
    if (query.isEmpty) return partners;
    
    final lowerQuery = query.toLowerCase();
    return partners.where((partner) =>
      (partner.nickName??'NULL').toLowerCase().contains(lowerQuery)
    ).toList();
  }

  Future<bool> _fetch({bool isRefresh = false}) async {
    try {
      final res = await _fetchPartners.get(
        localCurrentPage,
        localPageSize,
      );

      if (res.status == Status.completed) {
        final newPartners = res.data?.content ?? [];
        final updatedHistory = isRefresh ? newPartners : [...state.history, ...newPartners];

        // Calculate distances in batch
        final historyWithDistance = updatedHistory.map((partner) {
          final distance = _calculateDistanceWithCache(partner);
          return partner.copyWith(distance: distance);
        }).toList();

        // Update pagination status
        isLastPage = newPartners.length < localPageSize;
        isLoaded = true;
        if (res.data?.pagination.total != null) {
          isLastPage = res.data!.pagination.total - 1 == localCurrentPage;
        }
        if (!isLastPage) localCurrentPage += 1;

        // Apply search filter to updated list
        final filteredHistory = _applySearchFilter(
          historyWithDistance,
          state.searchQuery,
        );

        emit(state.copyWith(
          history: historyWithDistance,
          filteredHistory: filteredHistory,
          isLoadingShimmer: false,
          isLoadingPagination: false,
          error: null,
          errorPagination: null,
        ));
        return true;
      } else {
        _handleError(res.error?.message ?? '', state.isLoadingPagination);
        return false;
      }
    } catch (e) {
      _handleError(e.toString(), state.isLoadingPagination);
      return false;
    }
  }

  void _handleError(String message, bool isPagination) {
    emit(state.copyWith(
      isLoadingShimmer: false,
      isLoadingPagination: false,
      errorPagination: isPagination ? message : null,
      error: !isPagination ? message : null,
    ));
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Radius of the earth in km
    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) *
        sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

}

// Debouncer utility class
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});
}