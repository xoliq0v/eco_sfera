import 'dart:math';

import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'partner_pagination_state.dart';


class PartnerPaginationCubit extends Cubit<PartnerPaginationState> with PaginationCubitWrapper {
  PartnerPaginationCubit(
      this._fetchPartners,{required int initialPageSize,}
      ):super(const PartnerPaginationState()){
    localInitialPageSize = initialPageSize;
    fetchHistory();
  }


  final FetchPartners _fetchPartners;

  Future<bool?> fetchHistory() async {
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) emit(state.copyWith(isLoadingShimmer: true));
    if (isLoaded && state.history.isNotEmpty) {
      emit(state.copyWith(isLoadingPagination: true));
    }
    return _fetch();
  }

  Future<bool?> refresh() async {
    if (state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    localCurrentPage = 0;
    return _fetch(isRefresh: true);
  }

  // Future<bool> _fetch({
  //   bool isRefresh = false,
  // }) async {
  //   final res = await _fetchPartners.get(
  //     localCurrentPage,
  //     localPageSize,
  //   );
  //   switch (res.status) {
  //     case Status.completed:
  //       final history = res.data?.content ?? [];
  //       isLastPage = history.length < localPageSize;
  //       isLoaded = true;
  //       if (res.data?.pagination.total != null) {
  //         isLastPage = res.data!.pagination.total - 1 == localCurrentPage;
  //       }
  //       if (!isLastPage) localCurrentPage += 1;
  //       if (isRefresh) {
  //         emit(state.copyWith(customers: history));
  //       } else {
  //         emit(state.copyWith(customers: [
  //           ...state.history,
  //           ...history,
  //         ]));
  //       }
  //       return true;
  //     case Status.error:
  //       if (state.isLoadingPagination) {
  //         emit(state.copyWith(errorPagination: res.error?.message ?? ''));
  //       } else {
  //         emit(state.copyWith(error: res.error?.message ?? ''));
  //       }
  //       return false;
  //   }
  // }


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


  Future<bool> _fetch({
  bool isRefresh = false,
}) async {
  final res = await _fetchPartners.get(
    localCurrentPage,
    localPageSize,
  );
  switch (res.status) {
    case Status.completed:
      final history = res.data?.content ?? [];
      isLastPage = history.length < localPageSize;
      isLoaded = true;
      if (res.data?.pagination.total != null) {
        isLastPage = res.data!.pagination.total - 1 == localCurrentPage;
      }
      if (!isLastPage) localCurrentPage += 1;

      // Get the user's current location (you need to implement this)
      final userLocation = await _getUserLocation();

      // Calculate and set the distance for each PartnerItem
      final updatedHistory = history.map((partner) {
        final distance = calculateDistance(
          userLocation.latitude,
          userLocation.longitude,
          double.parse(partner.latitude),
          double.parse(partner.longitude),
        );
        return partner.copyWith(distance: distance.toStringAsFixed(2));
      }).toList();

      if (isRefresh) {
        emit(state.copyWith(customers: updatedHistory));
      } else {
        emit(state.copyWith(customers: [
          ...state.history,
          ...updatedHistory,
        ]));
      }
      return true;
    case Status.error:
      if (state.isLoadingPagination) {
        emit(state.copyWith(errorPagination: res.error?.message ?? ''));
      } else {
        emit(state.copyWith(error: res.error?.message ?? ''));
      }
      return false;
  }
}

// Mock method to get the user's current location
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

}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});
}