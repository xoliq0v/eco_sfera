import 'dart:developer';

import 'package:core/core.dart' hide Map;
import 'package:dio/dio.dart';

abstract class BaseProvider {
  Future<ApiResponse<T>> apiCall<T>(
      Future<Response> request, {
        required T Function(dynamic data) dataFromJson,
        T? Function(dynamic errorData)? errorDataFromJson,
      }) async {
    try {
      final response = await request;
      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
            (data) => dataFromJson(data),
      )..success = true;
    } on DioException catch (e, s) {
      if (e.error is SessionExpiredException) {
        log('DIO SessionExpiredException caught');
        throw SessionExpiredException();
      }
      log('DioException provider ${e.type}');
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
        case DioExceptionType.badCertificate:
          return ApiResponse<T>(
            null,
            success: false,
            error: ApiResponseError(
              message: '${e.type}',
              reason: e.message ?? '',
            ),
          );
        case DioExceptionType.badResponse:
        case DioExceptionType.unknown:
          final errorData = e.response?.data;
          if (errorData != null) {
            log(
              'Error data DioErrorType.unknown data not null:'
                  '$e ${e.response?.data} ${e.error} ${e.stackTrace}',
            );
            try {
              final errorResponse = ApiResponse.fromJson(
                errorData as Map<String, dynamic>,
                    (data) => errorDataFromJson?.call(data),
              );

              return ApiResponse<T>(
                errorResponse.data,
                success: errorResponse.success,
                error: errorResponse.error,
              );
            } catch (ee) {
              log(
                'Error data DioErrorType.unknown catch:'
                    '$e ${e.response?.data} ${e.error} ${e.stackTrace}',
              );
              log(
                'Error data DioErrorType.unknown catch: $ee',
              );
              return ApiResponse(
                null,
                success: false,
                error: ApiResponseError(
                  reason: 'Error Data parse is bad',
                  message: 'Error code: ${e.response?.statusCode}',
                ),
              );
            }
          }
          log(
            'Error data DioErrorType.unknown:'
                '$e ${e.response?.data} ${e.error} ${e.stackTrace}',
          );
          return ApiResponse(
            null,
            success: false,
            error: ApiResponseError(
              reason: 'Data is null',
              message: 'Error code: ${e.response?.statusCode}',
            ),
          );
        case DioExceptionType.cancel:
          log('${e.message}');
          throw RequestCancelled(e.message);
      }
    } on RequestCancelled {
      log('RequestCancelled');
      rethrow;
    } on Exception catch (e, s) {
      log('Exception $e');
      return ApiResponse<T>(
        null,
        success: false,
        error: ApiResponseError(
          message: 'somethingWentWrong',
          reason: '$e',
        ),
      );
    }
  }
}