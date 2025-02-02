import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import '../geocoding.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';

class AppGeocodingImpl implements AppGeocoding {
  AppGeocodingImpl({required this.yandexGeocoder});


  final YandexGeocoder yandexGeocoder;

  @override
  Future<ApiResponse<String?>> getCurrentAddress({
    required double long,
    required double lat,
  }) async {
    try {
      final address = await yandexGeocoder.getGeocode(
        ReverseGeocodeRequest(
          pointGeocode: (lat: lat, lon: long),
          kind: KindRequest.house,
        ),
      );
      final place = address.firstAddress;
      if (place == null) return ApiResponse(null, success: true);
      debugPrint('place $place');
      String? street = '';
      String? house = '';
      place.components?.forEach((element) {
        switch (element.kind) {
          case KindResponse.house:
            house = element.name;
          case KindResponse.street:
            street = element.name;
          case KindResponse.district:
            street = element.name;
          case KindResponse.country:
          case KindResponse.metro:
          case KindResponse.locality:
          case KindResponse.province:
          case KindResponse.area:
          case KindResponse.hydro:
          case KindResponse.unknown:
          case null:
            break;
        }
      });
      if (street == null || house == null) {
        return ApiResponse(
          null,
          success: true,
        );
      }
      return ApiResponse('$street, $house', success: true);
    } catch (e) {
      debugPrint('Error getCurrentAddress $e');
      return ApiResponse(
        null,
        error: ApiResponseError(
          reason: 'PlacemarkFromCoordinates',
          message: '$e',
        ),
        success: false,
      );
    }
  }
}
